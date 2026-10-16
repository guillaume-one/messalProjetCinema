from flask import Flask, jsonify, render_template
import pymysql
import pymysql.cursors
from config import Config # Importe la configuration
app = Flask(__name__)
def get_db_connection():
    """Crée la connexion à MariaDB avec les identifiants de config.py."""
    return pymysql.connect(
        host=Config.DB_HOST,
        user=Config.DB_USER,
        password=Config.DB_PASSWORD,
        database=Config.DB_NAME,
        cursorclass=pymysql.cursors.DictCursor # Renvoie les lignes sous forme de dictionnaires
        )
# Route unique pour la page d'accueil
@app.route('/testBDD')
def home():
    connection = None
    try:
        # 1. Connexion à la base
        connection = get_db_connection()

        # 2. Exécution de la requête SQL
        with connection.cursor() as cursor:
            cursor.execute("SELECT count(*) FROM film;")
            resultat = cursor.fetchone() # ou fetchall() pour obtenir tous les résultats

        # 3. Affichage du résultat au format JSON
        return jsonify({
            "statut": "succès",
            "message": "Connexion BDD réussie !",
            "donnees": resultat
        }), 200

    except pymysql.MySQLError as error:
        # En cas d'erreur de connexion ou SQL
        return jsonify({
            "statut": "erreur",
            "message": f"Impossible de se connecter : {str(error)}"
        }), 500

    finally:
        # 4. Fermeture obligatoire de la connexion
        if connection and connection.open:
            connection.close()

@app.route('/')
def index():

    co = get_db_connection()
    cursor = co.cursor()

    requete = "SELECT seances.ID, heure_date, id_film, id_salle, film.titre, salle.num, film.resume, film.affiche FROM seances JOIN film ON film.ID = seances.id_film JOIN salle ON seances.id_salle = salle.ID ORDER BY heure_date LIMIT 1;"
    cursor.execute(requete)

    prochaine_seance = cursor.fetchone()

    return render_template('index.html', prochaine_seance=prochaine_seance)

@app.route('/seances')
def seances():
    return render_template('seances.html')

@app.route('/film-croquette')
def film_croquette():
    return render_template('film-croquette.html')

@app.route('/film-leemiller')
def film_leemiller():
    return render_template('film-leemiller.html')

@app.route('/film-smile')
def film_smile():
    return render_template('film-smile.html')

if __name__ == '__main__':
    app.run(debug=True)