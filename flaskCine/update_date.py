import random
from datetime import datetime, timedelta
import pymysql
import pymysql.cursors
from config import Config # Importe la configuration

def get_db_connection():
    """Crée la connexion à MariaDB avec les identifiants de config.py."""
    return pymysql.connect(
        host=Config.DB_HOST,
        user=Config.DB_USER,
        password=Config.DB_PASSWORD,
        database=Config.DB_NAME,
        cursorclass=pymysql.cursors.DictCursor # Renvoie les lignes sous forme de dictionnaires
        )

def generer_date_proche():
    """Génère une date aléatoire entre maintenant et dans 3 jours maximum."""
    maintenant = datetime.now()
    jours_en_plus = random.randint(0, 3)
    date_cible = maintenant + timedelta(days=jours_en_plus)

    # Horaire réaliste entre 10h et 22h (à heure pile ou demi-heure)
    heure = random.randint(10, 22)
    minute = random.choice([0, 30])
    date_cible = date_cible.replace(
        hour=heure, minute=minute, second=0, microsecond=0
    )

    # Si l'heure tirée aujourd'hui est déjà passée, on décale à demain
    if date_cible <= maintenant:
        date_cible += timedelta(days=1)

    return date_cible.strftime('%Y-%m-%d %H:%M:%S')


def mettre_a_jour_seances():
    conn = None
    try:
        co = get_db_connection()
        cursor = co.cursor()

        # Récupération de toutes les séances
        cursor.execute('SELECT ID FROM seances')
        seances = cursor.fetchall()

        # Mise à jour ligne par ligne
        for seance in seances:
            nouvelle_date = generer_date_proche()
            cursor.execute(
                'UPDATE seances SET heure_date = %s WHERE ID = %s',
                (nouvelle_date, seance['ID']),
            )
            print(f"Séance ID {seance['ID']} mise à jour -> {nouvelle_date}")

        co.commit()
        print(f'\nSuccès : {len(seances)} séances mises à jour.')

        co.close()
    except pymysql.MySQLError as e:
        print(f'Erreur MariaDB : {e}')

mettre_a_jour_seances()