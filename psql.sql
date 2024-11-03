-- Créer le type ENUM pour le rôle
CREATE TYPE role_enum AS ENUM ('user', 'admin');

-- Créer la table groupes
CREATE TABLE groupes (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(255) NOT NULL
);

-- Créer la table membres
CREATE TABLE membres (
    id SERIAL PRIMARY KEY,
    pseudo VARCHAR(255) NOT NULL,
    mail VARCHAR(255) NOT NULL,
    motdepasse VARCHAR(255) NOT NULL,
    avatar VARCHAR(255),
    role role_enum NOT NULL  -- Utiliser le type ENUM créé
);

-- Créer la table membre_groupe
CREATE TABLE membre_groupe (
    membre_id INT REFERENCES membres(id) ON DELETE CASCADE,
    groupe_id INT REFERENCES groupes(id) ON DELETE CASCADE,
    PRIMARY KEY (membre_id, groupe_id)
);

- Supprimer les index existants si nécessaire
DROP INDEX IF EXISTS "IDX_nom";
DROP INDEX IF EXISTS "IDX_mail";
DROP INDEX IF EXISTS "IDX_prenom";
DROP INDEX IF EXISTS "IDX_id_ue";


-- Créer des index
CREATE INDEX "IDX_nom" ON public.etudiants USING BTREE (nom);
CREATE INDEX "IDX_prenom" ON public.etudiants USING BTREE (prenom);
CREATE UNIQUE INDEX "IDX_mail" ON public.etudiants USING BTREE (mail);
CREATE INDEX "IDX_id_ue" ON public.etudiants USING BTREE (id_ue);

INSERT INTO public.etudiants( nom, prenom, mail, id_ue)
	VALUES ('waffo2','lele2','lele2@gmail.com', 4);

	
	SELECT * FROM public.etudiants;