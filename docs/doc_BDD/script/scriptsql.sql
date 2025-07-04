drop database if exists goblandv2;
create database goblandv2;
use goblandv2;

CREATE TABLE player(
   id UUID,
   email VARCHAR(255)  NOT NULL,
   maxcharacter INT NOT NULL,
   name VARCHAR(255)  NOT NULL,
   imageprofil VARCHAR(255) ,
   PRIMARY KEY(id)
);

CREATE TABLE family(
   id UUID,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE profession(
   id UUID,
   code VARCHAR(255)  NOT NULL,
   name VARCHAR(255)  NOT NULL,
   rank_ enum NOT NULL ('apprentice' ,'companion' , 'master' , 'grandmaster'),
   PRIMARY KEY(id)
);

CREATE TABLE Clan(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   datecreation DATETIME NOT NULL,
   description TEXT,
   blazon VARCHAR(100)  NOT NULL,
   pledgeallegiance UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(pledgeallegiance) REFERENCES Clan(id)
);

CREATE TABLE mail(
   id UUID,
   title VARCHAR(255) ,
   text TEXT NOT NULL,
   datesend DATETIME NOT NULL,
   sender UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(sender) REFERENCES player(id)
);

CREATE TABLE pack(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   namechef VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE BM(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   bonusmalus BOOLEAN NOT NULL,
   numberturns INT NOT NULL,
   numberattack INT NOT NULL,
   concentration INT NOT NULL,
   nextturn DATETIME NOT NULL,
   permanent BOOLEAN NOT NULL,
   original BOOLEAN NOT NULL,
   psychicresist INT NOT NULL,
   psychicmast INT NOT NULL,
   physicalresist INT NOT NULL,
   physicalmast INT NOT NULL,
   magicresist INT NOT NULL,
   magicmast INT NOT NULL,
   obscureresist INT NOT NULL,
   obscuremast INT NOT NULL,
   socialrest INT NOT NULL,
   socialmast INT NOT NULL,
   technologyresist INT NOT NULL,
   technologymast INT NOT NULL,
   perception INT NOT NULL,
   regeneration INT NOT NULL,
   damage INT NOT NULL,
   attack INT NOT NULL,
   dogde INT NOT NULL,
   hunger INT NOT NULL,
   hitpointsmax INT NOT NULL,
   hitpoints INT NOT NULL,
   actionpoint INT NOT NULL,
   armphy INT NOT NULL,
   armmag INT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE tribe(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   datecreation DATETIME NOT NULL,
   description TEXT,
   blazon VARCHAR(100)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE alert(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   description VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE credential(
   id UUID,
   password VARCHAR(255)  NOT NULL,
   mainpassword BOOLEAN NOT NULL DEFAULT FALSE,
   begindate DATETIME NOT NULL,
   enddate DATETIME NOT NULL,
   secretauth VARCHAR(255)  NOT NULL,
   player UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(player) REFERENCES player(id)
);

CREATE TABLE soul(
   id UUID,
   xp INT NOT NULL,
   ip INT NOT NULL,
   iptotal INT NOT NULL,
   level INT NOT NULL,
   trollcanines INT NOT NULL,
   nextlevelcount INT NOT NULL,
   startingbonusstat ENUM('attack', 'magic', 'dodge', 'damage', 'regeneration', 'perception') NOT NULL,
   player UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(player) REFERENCES player(id)
);

CREATE TABLE talenttype(
   code VARCHAR(2) ,
   name VARCHAR(50) ,
   PRIMARY KEY(code)
);

CREATE TABLE affinity(
   code VARCHAR(2) ,
   name VARCHAR(50) ,
   PRIMARY KEY(code)
);

CREATE TABLE prerequisited(
   code VARCHAR(2) ,
   name VARCHAR(50) ,
   level INT,
   PRIMARY KEY(code)
);

CREATE TABLE subfamilyobject(
   id UUID,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE levelseeinvisible(
   code VARCHAR(50) ,
   name VARCHAR(50)  NOT NULL,
   description VARCHAR(255)  NOT NULL,
   PRIMARY KEY(code)
);

CREATE TABLE servicetype(
   id UUID,
   name VARCHAR(50) ,
   costmin INT NOT NULL,
   costmax INT NOT NULL,
   basescript VARCHAR(255)  NOT NULL,
   costinstall BIGINT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE service(
   id UUID,
   name VARCHAR(50) ,
   cost INT NOT NULL,
   script VARCHAR(255)  NOT NULL,
   status BOOLEAN NOT NULL,
   size INT NOT NULL,
   servicetype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(servicetype) REFERENCES servicetype(id)
);

CREATE TABLE familybuilding(
   id UUID,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE cockroachtype(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   obtainlevelup BOOLEAN NOT NULL,
   effect VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE gameworldtype(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   xsuperiormin INT NOT NULL,
   xsuperiormax INT NOT NULL,
   xinferiormin INT NOT NULL,
   xinferiormax INT NOT NULL,
   ysuperiormin INT NOT NULL,
   ysuperiormax INT NOT NULL,
   yinferiormax INT NOT NULL,
   yinferiormin INT NOT NULL,
   nsuperiormax INT NOT NULL,
   nsuperiormin INT NOT NULL,
   ninferiormax INT NOT NULL,
   ninferiormin INT NOT NULL,
   matter VARCHAR(50)  NOT NULL,
   architecture VARCHAR(255)  NOT NULL,
   description TEXT NOT NULL,
   script VARCHAR(255)  NOT NULL,
   hitpoints INT NOT NULL,
   psychicresistmin INT NOT NULL,
   psychicresistmax INT NOT NULL,
   physicalresistmin INT NOT NULL,
   physicalresistmax INT NOT NULL,
   magicresistmin INT NOT NULL,
   magicresistmax INT NOT NULL,
   obscureresistmax INT NOT NULL,
   obscureresistmin INT NOT NULL,
   technologyresistmin INT NOT NULL,
   technologyresistmax INT NOT NULL,
   socialresistmax INT NOT NULL,
   socialresistmin INT NOT NULL,
   arm INT NOT NULL,
   gender BOOLEAN NOT NULL,
   taxesorigine INT NOT NULL DEFAULT 0,
   instanceupgrade UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(instanceupgrade) REFERENCES gameworldtype(id)
);

CREATE TABLE vacancy(
   id UUID,
   datestart DATETIME NOT NULL,
   dateend DATETIME NOT NULL,
   player UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(player) REFERENCES player(id)
);

CREATE TABLE zodiac(
   id UUID,
   zodiacsign VARCHAR(255)  NOT NULL,
   effect VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE month_(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   numberday INT NOT NULL,
   order_ INT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE news(
   id UUID,
   tittle VARCHAR(255)  NOT NULL,
   message TEXT NOT NULL,
   datestart DATE NOT NULL,
   dateend DATE NOT NULL,
   author UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(author) REFERENCES player(id)
);

CREATE TABLE featfamily(
   id UUID,
   nom VARCHAR(50) ,
   PRIMARY KEY(id)
);

CREATE TABLE recipe(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   prestige INT NOT NULL,
   height INT NOT NULL,
   author VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE distinctions(
   id UUID,
   title VARCHAR(255)  NOT NULL,
   description VARCHAR(255)  NOT NULL,
   duree INT,
   size INT NOT NULL,
   location enum NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE talentinventory(
   id UUID,
   script VARCHAR(255)  NOT NULL,
   actionpoint INT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE areatype(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   AreaEffectTypes enum NOT NULL,
   xsuperiormin INT NOT NULL,
   xsuperiormax INT NOT NULL,
   xinferiormin INT NOT NULL,
   xinferiormax INT NOT NULL,
   ysuperiormin INT NOT NULL,
   ysuperiormax INT NOT NULL,
   yinferiormin INT NOT NULL,
   yinferiormax INT NOT NULL,
   nsuperiormin INT NOT NULL,
   nsuperiormax INT NOT NULL,
   ninferiormin INT NOT NULL,
   ninferiormax INT NOT NULL,
   duration DATETIME NOT NULL,
   resistance INT NOT NULL,
   hitpoints INT NOT NULL,
   arm INT NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE diets(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE etatdumarchepast(
   id UUID,
   price DECIMAL(15,2)   NOT NULL,
   update_ DATETIME NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE approval(
   id UUID,
   name enum NOT NULL,
   PRIMARY KEY(id)
);

CREATE TABLE familyobject_1(
   id UUID,
   nom VARCHAR(50) ,
   id_1 UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES subfamilyobject(id)
);

CREATE TABLE talent(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   ruledescription VARCHAR(255)  NOT NULL,
   rpdescription VARCHAR(255)  NOT NULL,
   script VARCHAR(255)  NOT NULL,
   actionpointcost INT NOT NULL,
   level INT NOT NULL,
   componentcount INT NOT NULL,
   target BOOLEAN,
   talentypecode VARCHAR(2)  NOT NULL,
   affinitycode VARCHAR(2) ,
   PRIMARY KEY(id),
   FOREIGN KEY(talentypecode) REFERENCES talenttype(code),
   FOREIGN KEY(affinitycode) REFERENCES affinity(code)
);

CREATE TABLE feat(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   level INT NOT NULL,
   ip INT NOT NULL,
   rankmax enum NOT NULL ('apprentice' ,'companion' , 'master' , 'grandmaster'),
   description VARCHAR(255)  NOT NULL,
   script VARCHAR(255)  NOT NULL,
   family UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(family) REFERENCES featfamily(id)
);

CREATE TABLE gameworld(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   xsuperior INT NOT NULL,
   xinferior INT NOT NULL,
   ysuperior INT NOT NULL,
   yinferior INT NOT NULL,
   nsuperior INT NOT NULL,
   ninferior INT NOT NULL,
   architecture VARCHAR(255)  NOT NULL,
   script VARCHAR(255)  NOT NULL,
   hitpoints INT NOT NULL,
   description TEXT NOT NULL,
   physicalresist INT NOT NULL,
   psychicresist INT NOT NULL,
   obscureresist INT NOT NULL,
   technologyresist INT NOT NULL,
   magicresist INT NOT NULL,
   sociaresist INT NOT NULL,
   arm INT NOT NULL,
   taxes INT,
   update_ DATETIME NOT NULL,
   instancetype UUID NOT NULL,
   proprietaryentity UUID,
   proprietaryclan UUID,
   proprietarytribe UUID,
   PRIMARY KEY(id),
   UNIQUE(proprietaryclan),
   UNIQUE(proprietarytribe),
   FOREIGN KEY(instancetype) REFERENCES gameworldtype(id),
   FOREIGN KEY(proprietaryentity) REFERENCES soul(id),
   FOREIGN KEY(proprietaryclan) REFERENCES Clan(id),
   FOREIGN KEY(proprietarytribe) REFERENCES tribe(id)
);

CREATE TABLE specie(
   id UUID,
   name VARCHAR(150)  NOT NULL,
   attackmin INT NOT NULL,
   attackmax INT NOT NULL,
   damagemin INT NOT NULL,
   damagemax INT NOT NULL,
   dogdemin INT NOT NULL,
   dogdemax INT NOT NULL,
   regenerationmin INT NOT NULL,
   regenerationmax INT NOT NULL,
   perceptionmin INT NOT NULL,
   perceptionmax INT NOT NULL,
   hitpointsmin INT NOT NULL,
   hitpointsmax INT NOT NULL,
   turndurationmin BOOLEAN NOT NULL,
   turndurationmax BOOLEAN NOT NULL,
   leveladjust INT NOT NULL,
   psychicmastmin INT NOT NULL,
   psychicmastmax INT NOT NULL,
   psychicresistmax INT NOT NULL,
   psychicresistmin INT NOT NULL,
   physicalresistmin INT NOT NULL,
   physicalresistmax INT NOT NULL,
   physicalmastmin INT NOT NULL,
   physicalmastmax INT NOT NULL,
   magicresistmin INT NOT NULL,
   magicresistmax INT NOT NULL,
   magicmastmin INT NOT NULL,
   magicmastmax INT NOT NULL,
   obscureresistmin INT NOT NULL,
   obscureresistmax INT NOT NULL,
   obscuremastmin INT NOT NULL,
   obscuremastmax INT NOT NULL,
   technologyresistmin INT NOT NULL,
   technologyresistmax INT NOT NULL,
   technologymastmax INT NOT NULL,
   technologymastmin INT NOT NULL,
   socialresistmin INT NOT NULL,
   socialresistmax INT NOT NULL,
   socialmastmin INT NOT NULL,
   socialmastmax INT NOT NULL,
   nbapmovemin INT NOT NULL,
   nbapmovemax INT NOT NULL,
   nbattackmin INT NOT NULL,
   nbattackmax INT NOT NULL,
   papowersecond INT NOT NULL,
   nbapattackmin INT NOT NULL,
   nbapattackmax INT NOT NULL,
   rangex INT NOT NULL,
   rangey INT NOT NULL,
   armphymin INT NOT NULL,
   armphymax INT NOT NULL,
   armmagmin INT NOT NULL,
   armmagmax INT NOT NULL,
   deadpower enum NOT NULL,
   attpower enum NOT NULL,
   hitpower enum NOT NULL,
   fleepower enum NOT NULL,
   specialpower enum NOT NULL,
   secondpower enum NOT NULL,
   sizemin INT NOT NULL,
   sizemax INT NOT NULL,
   flight BOOLEAN NOT NULL DEFAULT FALSE,
   wallpass INT NOT NULL,
   nmin INT NOT NULL,
   nmax INT NOT NULL,
   needsfood BOOLEAN NOT NULL default false,
   corpsedeath BOOLEAN NOT NULL default false,
   collector BOOLEAN NOT NULL,
   gender BOOLEAN NOT NULL,
   devapproval BOOLEAN NOT NULL,
   devnote CHAR(255) ,
   levelseeinvisible VARCHAR(50)  NOT NULL,
   familly UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(levelseeinvisible) REFERENCES levelseeinvisible(code),
   FOREIGN KEY(familly) REFERENCES family(id)
);

CREATE TABLE buildingtype(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   costmin VARCHAR(50)  NOT NULL,
   gender BOOLEAN NOT NULL,
   costinstall INT NOT NULL,
   costupkeep INT NOT NULL,
   hitpoints INT NOT NULL,
   arm INT NOT NULL,
   script VARCHAR(255)  NOT NULL,
   capacity INT NOT NULL,
   size INT NOT NULL,
   visibility BOOLEAN NOT NULL DEFAULT false,
   buildupgrade UUID,
   servicetype UUID NOT NULL,
   family UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(buildupgrade) REFERENCES buildingtype(id),
   FOREIGN KEY(servicetype) REFERENCES servicetype(id),
   FOREIGN KEY(family) REFERENCES familybuilding(id)
);

CREATE TABLE cockroach(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   age INT NOT NULL,
   status INT NOT NULL,
   souls UUID NOT NULL,
   cockroachtype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(souls) REFERENCES soul(id),
   FOREIGN KEY(cockroachtype) REFERENCES cockroachtype(id)
);

CREATE TABLE objecttype(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   weightmin INT NOT NULL,
   weightmax INT NOT NULL,
   qualitymin enum NOT NULL ('poor', 'common', 'uncommon', 'rare', 'epic', 'legendary') DEFAULT 'common',
   qualitymax enum NOT NULL ('poor', 'common', 'uncommon', 'rare', 'epic', 'legendary') DEFAULT 'common',
   deterioration enum ('excellent', 'good', 'average', 'damaged','rotten') DEFAULT "excellent",
   armphymin INT NOT NULL,
   armphymax INT NOT NULL,
   armmagmin INT NOT NULL,
   armmagmax INT NOT NULL,
   attackmin INT NOT NULL,
   attackmax INT NOT NULL,
   damagemin INT NOT NULL,
   damagemax INT NOT NULL,
   dogdemin INT NOT NULL,
   dogdemax INT NOT NULL,
   regenerationmin INT NOT NULL,
   regenerationmax INT NOT NULL,
   perceptionmin INT NOT NULL,
   perceptionmax INT NOT NULL,
   hitpointsmin INT NOT NULL,
   hitpointsmax INT NOT NULL,
   script VARCHAR(255) ,
   droppable BOOLEAN NOT NULL,
   psychicmastmin INT NOT NULL,
   psychicmastmax INT NOT NULL,
   psychicresistmin INT NOT NULL,
   psychicresistmax INT NOT NULL,
   physicalresistmin INT NOT NULL,
   physicalresistmax INT NOT NULL,
   physicalmastmin INT NOT NULL,
   physicalmastmax INT NOT NULL,
   magicresistmin INT NOT NULL,
   magicresistmax INT NOT NULL,
   magicmastmin INT NOT NULL,
   magicmastmax INT NOT NULL,
   obscureresistmin INT NOT NULL,
   obscureresistmax INT NOT NULL,
   obscuremastmin INT NOT NULL,
   obscuremastmax INT NOT NULL,
   technologyresistmin INT NOT NULL,
   technologyresistmax INT NOT NULL,
   technologymastmin INT NOT NULL,
   technologymastmax INT NOT NULL,
   socialresistmin INT NOT NULL,
   socialresistmax INT NOT NULL,
   socialmastmin INT NOT NULL,
   socialmastmax INT NOT NULL,
   description VARCHAR(255) ,
   levelmin INT NOT NULL,
   levelmax INT NOT NULL,
   pricemin INT NOT NULL,
   pricemax INT NOT NULL,
   sizemin INT NOT NULL,
   sizemax INT NOT NULL,
   cursed BOOLEAN NOT NULL,
   turnduration INT NOT NULL,
   chargemin INT NOT NULL,
   chargemax INT NOT NULL,
   gender BOOLEAN NOT NULL,
   satiety INT NOT NULL,
   recipe UUID,
   subfamily UUID NOT NULL,
   areatype UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(recipe) REFERENCES recipe(id),
   FOREIGN KEY(subfamily) REFERENCES subfamilyobject(id),
   FOREIGN KEY(areatype) REFERENCES areatype(id)
);

CREATE TABLE resourcenodetype(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   extractmin INT NOT NULL,
   extractmax INT NOT NULL,
   objecttype UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id)
);

CREATE TABLE location(
   target UUID,
   actor UUID,
   x INT NOT NULL,
   y VARCHAR(50)  NOT NULL,
   n INT NOT NULL,
   descriptionpassage TEXT,
   PRIMARY KEY(target, actor),
   UNIQUE(actor),
   FOREIGN KEY(target) REFERENCES gameworld(id),
   FOREIGN KEY(actor) REFERENCES gameworld(id)
);

CREATE TABLE weather(
   id UUID,
   xmin INT NOT NULL,
   xmax INT NOT NULL,
   ymin INT NOT NULL,
   ymax INT NOT NULL,
   validday DATE NOT NULL,
   rain INT NOT NULL,
   wind INT NOT NULL,
   heat INT NOT NULL,
   instance UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(instance) REFERENCES gameworld(id)
);

CREATE TABLE announcement(
   id UUID,
   text TEXT NOT NULL,
   id_1 UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES approval(id)
);

CREATE TABLE knows(
   soul UUID,
   talent UUID,
   percent INT,
   rank_ enum NOT NULL ('apprentice' ,'companion' , 'master' , 'grandmaster'),
   useinturn BOOLEAN NOT NULL,
   PRIMARY KEY(soul, talent),
   FOREIGN KEY(soul) REFERENCES soul(id),
   FOREIGN KEY(talent) REFERENCES talent(id)
);

CREATE TABLE component(
   id UUID,
   namemonsterpart VARCHAR(255)  NOT NULL,
   gender BOOLEAN NOT NULL,
   objecttype UUID NOT NULL,
   specie UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id),
   FOREIGN KEY(specie) REFERENCES specie(id)
);

CREATE TABLE day_(
   id UUID,
   numberday INT NOT NULL,
   year_ INT NOT NULL,
   script VARCHAR(50)  NOT NULL,
   plant UUID NOT NULL,
   month_ UUID NOT NULL,
   zodiac UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(plant) REFERENCES objecttype(id),
   FOREIGN KEY(month_) REFERENCES month_(id),
   FOREIGN KEY(zodiac) REFERENCES zodiac(id)
);

CREATE TABLE matter(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   objecttype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id)
);

CREATE TABLE entity(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   gender INT NOT NULL,
   description VARCHAR(255) ,
   imageavatar VARCHAR(255)  NOT NULL,
   datecreation DATETIME NOT NULL,
   datelastdeath DATETIME NOT NULL,
   turnduration TIME NOT NULL,
   nextturn DATETIME NOT NULL,
   actionpoint INT NOT NULL,
   hitpoints INT NOT NULL,
   hitpointsmax INT NOT NULL,
   hunger INT NOT NULL,
   kills INT NOT NULL,
   pvpkills INT NOT NULL,
   turnattckdomage INT NOT NULL,
   deathcounts INT NOT NULL,
   dogde INT NOT NULL,
   attack INT NOT NULL,
   damagephy INT NOT NULL,
   damagemag INT NOT NULL,
   regeneration INT NOT NULL,
   perception INT NOT NULL,
   active BOOLEAN NOT NULL DEFAULT TRUE,
   psychicresist INT NOT NULL,
   psychicmast INT NOT NULL,
   physicalresist INT NOT NULL,
   physicalmast INT NOT NULL,
   magicresist INT NOT NULL,
   magicmast INT NOT NULL,
   obscureresist INT NOT NULL,
   obscuremast INT NOT NULL,
   socialresist INT NOT NULL,
   socialmast INT NOT NULL,
   technologyresist INT NOT NULL,
   technologymast INT NOT NULL,
   x INT NOT NULL,
   y INT NOT NULL,
   n INT NOT NULL,
   pvp BOOLEAN NOT NULL,
   nbapmove INT NOT NULL,
   nbapattack INT NOT NULL,
   nbattack INT NOT NULL,
   update_ DATETIME NOT NULL,
   saveuniquemob BOOLEAN,
   rangex INT NOT NULL,
   rangey INT NOT NULL,
   size INT NOT NULL,
   armphy INT NOT NULL,
   armmag INT NOT NULL,
   upgradeturnduration INT,
   upgradeattack INT,
   upgradedodge INT,
   upgradeperception INT,
   upgradedamege INT,
   upgradehitpoints INT,
   upgraderegeneration INT,
   upgradearmphy INT,
   upgradearmmag INT,
   status enum NOT NULL,
   popularity INT,
   fame INT,
   reputation INT,
   profession UUID,
   service UUID,
   diets UUID NOT NULL,
   talentinventory UUID,
   birthday UUID NOT NULL,
   locationinstance UUID NOT NULL,
   master UUID,
   levelseeinvisible VARCHAR(50)  NOT NULL,
   soul UUID NOT NULL,
   specie UUID NOT NULL,
   pack UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(profession) REFERENCES profession(id),
   FOREIGN KEY(service) REFERENCES service(id),
   FOREIGN KEY(diets) REFERENCES diets(id),
   FOREIGN KEY(talentinventory) REFERENCES talentinventory(id),
   FOREIGN KEY(birthday) REFERENCES day_(id),
   FOREIGN KEY(locationinstance) REFERENCES gameworld(id),
   FOREIGN KEY(master) REFERENCES entity(id),
   FOREIGN KEY(levelseeinvisible) REFERENCES levelseeinvisible(code),
   FOREIGN KEY(soul) REFERENCES soul(id),
   FOREIGN KEY(specie) REFERENCES specie(id),
   FOREIGN KEY(pack) REFERENCES pack(id)
);

CREATE TABLE quest(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   prioritylevel INT NOT NULL,
   description TEXT NOT NULL,
   teamsizemax INT NOT NULL,
   script VARCHAR(255)  NOT NULL,
   condition_ VARCHAR(255)  NOT NULL,
   questtype enum NOT NULL,
   customer UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(customer) REFERENCES entity(id)
);

CREATE TABLE object(
   id UUID,
   realname VARCHAR(255)  NOT NULL,
   renamename VARCHAR(255)  NOT NULL,
   attack INT NOT NULL,
   dogde INT NOT NULL,
   damage INT NOT NULL,
   armmag INT NOT NULL,
   armphy INT NOT NULL,
   perception INT NOT NULL,
   regeneration INT NOT NULL,
   quality enum('poor', 'common', 'uncommon', 'rare', 'epic', 'legendary') NOT NULL,
   weighttime INT NOT NULL,
   actionpoint INT NOT NULL,
   psychicmast INT NOT NULL,
   physicalresist INT NOT NULL,
   psychicresist INT NOT NULL,
   physicalmast INT NOT NULL,
   magicresist INT NOT NULL,
   magicmast INT NOT NULL,
   obscureresist INT NOT NULL,
   obscuremast INT NOT NULL,
   sociaresist INT NOT NULL,
   socialmast INT NOT NULL,
   technologyresist INT NOT NULL,
   technologymast INT NOT NULL,
   update_ DATETIME NOT NULL,
   bury BOOLEAN NOT NULL,
   rarity VARCHAR(255)  NOT NULL,
   hitpoints INT NOT NULL,
   description VARCHAR(255)  NOT NULL,
   droppable BOOLEAN NOT NULL,
   price INT NOT NULL,
   size INT NOT NULL,
   level INT NOT NULL,
   cursed BOOLEAN NOT NULL,
   turneffect INT NOT NULL,
   charge INT NOT NULL,
   deterioration enum NOT NULL ('excellent', 'good', 'average', 'damaged','rotten') ,
   visibility BOOLEAN NOT NULL DEFAULT false,
   areaeffect INT NOT NULL,
   satiety INT NOT NULL,
   objecttype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id)
);

CREATE TABLE religion(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   text TEXT NOT NULL,
   levelrequire INT NOT NULL,
   pietygod INT NOT NULL,
   god UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(god) REFERENCES entity(id)
);

CREATE TABLE queststep(
   id UUID,
   description VARCHAR(250)  NOT NULL,
   step INT NOT NULL,
   finalstep BOOLEAN NOT NULL,
   typestep INT NOT NULL,
   difficulty INT NOT NULL,
   arg1 VARCHAR(255)  NOT NULL,
   arg2 VARCHAR(255) ,
   arg3 VARCHAR(255) ,
   arg4 VARCHAR(255) ,
   arg5 VARCHAR(255) ,
   quest UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(quest) REFERENCES quest(id)
);

CREATE TABLE representation(
   id UUID,
   isillusion BOOLEAN NOT NULL DEFAULT FALSE,
   expirationdate DATETIME NOT NULL,
   x INT NOT NULL,
   y INT NOT NULL,
   n INT NOT NULL,
   entity UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(entity) REFERENCES entity(id)
);

CREATE TABLE resourcenode(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   x INT NOT NULL,
   y VARCHAR(50)  NOT NULL,
   n INT NOT NULL,
   extract_ INT NOT NULL,
   instance UUID NOT NULL,
   ressourcenodetype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(instance) REFERENCES gameworld(id),
   FOREIGN KEY(ressourcenodetype) REFERENCES resourcenodetype(id)
);

CREATE TABLE event(
   id UUID,
   date_ DATETIME NOT NULL,
   action enum NOT NULL,
   description VARCHAR(255)  NOT NULL,
   visibility BOOLEAN NOT NULL,
   targetentity UUID,
   targetobject UUID,
   actorentity UUID,
   actorobject UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(targetentity) REFERENCES entity(id),
   FOREIGN KEY(targetobject) REFERENCES object(id),
   FOREIGN KEY(actorentity) REFERENCES entity(id),
   FOREIGN KEY(actorobject) REFERENCES object(id)
);

CREATE TABLE building(
   id UUID,
   name VARCHAR(50)  NOT NULL,
   gender BOOLEAN NOT NULL,
   costupkeep INT NOT NULL,
   hitpoints INT NOT NULL,
   arm INT NOT NULL,
   script VARCHAR(255)  NOT NULL,
   capacity INT NOT NULL,
   size INT NOT NULL,
   x INT NOT NULL,
   n INT NOT NULL,
   y INT NOT NULL,
   visibility BOOLEAN NOT NULL,
   bank BIGINT NOT NULL,
   proprietaryentity UUID,
   buildingtype UUID NOT NULL,
   instance UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(proprietaryentity) REFERENCES entity(id),
   FOREIGN KEY(buildingtype) REFERENCES buildingtype(id),
   FOREIGN KEY(instance) REFERENCES gameworld(id)
);

CREATE TABLE adherent_of(
   souls UUID,
   religion UUID,
   rank_ enum('apprentice' ,'companion' , 'master' , 'grandmaster') NOT NULL,
   piety INT NOT NULL,
   PRIMARY KEY(souls, religion),
   FOREIGN KEY(souls) REFERENCES soul(id),
   FOREIGN KEY(religion) REFERENCES religion(id)
);

CREATE TABLE enchantrequire(
   id UUID,
   service UUID NOT NULL,
   entity UUID NOT NULL,
   object UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(service) REFERENCES service(id),
   FOREIGN KEY(entity) REFERENCES entity(id),
   FOREIGN KEY(object) REFERENCES object(id)
);

CREATE TABLE ai(
   Id UUID,
   status enum NOT NULL,
   behavior INT NOT NULL,
   lastaction INT NOT NULL,
   statusai enum NOT NULL,
   nmin INT NOT NULL,
   nmax INT NOT NULL,
   following BOOLEAN NOT NULL,
   vendor BOOLEAN NOT NULL,
   den UUID NOT NULL,
   entity UUID NOT NULL,
   PRIMARY KEY(Id),
   UNIQUE(entity),
   FOREIGN KEY(den) REFERENCES gameworld(id),
   FOREIGN KEY(entity) REFERENCES entity(id)
);

CREATE TABLE diplomacy(
   id UUID,
   title VARCHAR(255) ,
   visibilitylevel ENUM('public', 'private', 'secret') NOT NULL,
   relationshipstatus ENUM('friendly', 'neutral', 'hostile', 'unknown') NOT NULL,
   update_ DATETIME NOT NULL,
   targetclan UUID,
   actorclan UUID NOT NULL,
   targetentity UUID,
   PRIMARY KEY(id),
   FOREIGN KEY(targetclan) REFERENCES Clan(id),
   FOREIGN KEY(actorclan) REFERENCES Clan(id),
   FOREIGN KEY(targetentity) REFERENCES entity(id)
);

CREATE TABLE reward(
   id UUID,
   script VARCHAR(255)  NOT NULL,
   arg1 VARCHAR(255)  NOT NULL,
   arg2 VARCHAR(255)  NOT NULL,
   arg3 VARCHAR(255)  NOT NULL,
   arg4 VARCHAR(255)  NOT NULL,
   rewardtype UUID,
   quest UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(rewardtype) REFERENCES objecttype(id),
   FOREIGN KEY(quest) REFERENCES quest(id)
);

CREATE TABLE order_(
   id UUID,
   ordertype enum NOT NULL,
   option VARCHAR(255) ,
   levelpriority INT NOT NULL,
   pnj UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(pnj) REFERENCES entity(id)
);

CREATE TABLE declarationlove(
   applicant UUID,
   ConfessionTargets UUID,
   text TEXT NOT NULL,
   dateconfession DATETIME NOT NULL,
   response enum('no', 'yes', 'slap') NOT NULL,
   PRIMARY KEY(applicant, ConfessionTargets),
   FOREIGN KEY(applicant) REFERENCES entity(id),
   FOREIGN KEY(ConfessionTargets) REFERENCES entity(id)
);

CREATE TABLE area(
   id UUID,
   name VARCHAR(255)  NOT NULL,
   AreaEffectTypes enum NOT NULL,
   xsuperior INT NOT NULL,
   xinferior INT NOT NULL,
   ysuperior INT NOT NULL,
   yinferior INT NOT NULL,
   nsuperior INT NOT NULL,
   ninferior INT NOT NULL,
   duration DATETIME NOT NULL,
   resistance INT NOT NULL,
   hitpoints INT NOT NULL,
   arm INT NOT NULL,
   instance UUID NOT NULL,
   creator UUID NOT NULL,
   areatype UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(instance) REFERENCES gameworld(id),
   FOREIGN KEY(creator) REFERENCES entity(id),
   FOREIGN KEY(areatype) REFERENCES areatype(id)
);

CREATE TABLE transaction(
   customer UUID,
   vendor UUID,
   pricevendor INT NOT NULL,
   pricecustomer INT NOT NULL,
   validationvendor BOOLEAN NOT NULL,
   validationcustomer BOOLEAN NOT NULL,
   id UUID NOT NULL,
   PRIMARY KEY(customer, vendor),
   FOREIGN KEY(customer) REFERENCES entity(id),
   FOREIGN KEY(vendor) REFERENCES entity(id),
   FOREIGN KEY(id) REFERENCES object(id)
);

CREATE TABLE etatdumarchepresent(
   id UUID,
   price DECIMAL(15,2)   NOT NULL,
   update_ DATETIME NOT NULL,
   matter UUID,
   object UUID,
   id_1 UUID NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(id_1),
   FOREIGN KEY(matter) REFERENCES matter(id),
   FOREIGN KEY(object) REFERENCES object(id),
   FOREIGN KEY(id_1) REFERENCES etatdumarchepast(id)
);

CREATE TABLE prayer(
   id UUID,
   percent INT NOT NULL,
   title VARCHAR(255)  NOT NULL,
   text TEXT NOT NULL,
   pietymin INT NOT NULL,
   levelrequire INT NOT NULL,
   effect VARCHAR(255) ,
   religion UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(religion) REFERENCES religion(id)
);

CREATE TABLE enchant(
   id UUID,
   name VARCHAR(50) ,
   attack INT NOT NULL,
   dogde INT NOT NULL,
   damage INT NOT NULL,
   armmag INT NOT NULL,
   armphy INT NOT NULL,
   regeneration INT NOT NULL,
   perception INT NOT NULL,
   psychicmast INT NOT NULL,
   physicalresist INT NOT NULL,
   psychicresist INT NOT NULL,
   physicalmast INT NOT NULL,
   magicresist INT NOT NULL,
   magicmast INT NOT NULL,
   obscureresist INT NOT NULL,
   obscuremast INT NOT NULL,
   socialresist INT NOT NULL,
   socialmast INT NOT NULL,
   technologyresist INT NOT NULL,
   technologymast INT NOT NULL,
   weighttime INT NOT NULL,
   droprate INT NOT NULL,
   id_1 UUID NOT NULL,
   PRIMARY KEY(id),
   FOREIGN KEY(id_1) REFERENCES enchantrequire(id)
);

CREATE TABLE objectbelong(
   proprietary UUID,
   object UUID,
   quantity VARCHAR(50)  NOT NULL,
   identify BOOLEAN NOT NULL,
   isequipped BOOLEAN NOT NULL,
   locationequipment INT NOT NULL,
   PRIMARY KEY(proprietary, object),
   FOREIGN KEY(proprietary) REFERENCES entity(id),
   FOREIGN KEY(object) REFERENCES object(id)
);

CREATE TABLE receive(
   player UUID,
   mail UUID,
   PRIMARY KEY(player, mail),
   FOREIGN KEY(player) REFERENCES player(id),
   FOREIGN KEY(mail) REFERENCES mail(id)
);

CREATE TABLE playeralert(
   player UUID,
   alert UUID,
   etat BOOLEAN NOT NULL,
   PRIMARY KEY(player, alert),
   FOREIGN KEY(player) REFERENCES player(id),
   FOREIGN KEY(alert) REFERENCES alert(id)
);

CREATE TABLE mode(
   credential UUID,
   soul UUID,
   code VARCHAR(255)  NOT NULL,
   name VARCHAR(255)  NOT NULL,
   PRIMARY KEY(credential, soul),
   FOREIGN KEY(credential) REFERENCES credential(id),
   FOREIGN KEY(soul) REFERENCES soul(id)
);

CREATE TABLE talentprerequisited(
   talent UUID,
   code VARCHAR(2) ,
   PRIMARY KEY(talent, code),
   FOREIGN KEY(talent) REFERENCES talent(id),
   FOREIGN KEY(code) REFERENCES prerequisited(code)
);

CREATE TABLE clanbelong(
   entity UUID,
   clan UUID,
   jobtitlem VARCHAR(255)  NOT NULL,
   jobtitlef VARCHAR(255)  NOT NULL,
   datejoin DATETIME NOT NULL,
   PRIMARY KEY(entity, clan),
   FOREIGN KEY(entity) REFERENCES entity(id),
   FOREIGN KEY(clan) REFERENCES Clan(id)
);

CREATE TABLE entitybm(
   entity UUID,
   bonus UUID,
   PRIMARY KEY(entity, bonus),
   FOREIGN KEY(entity) REFERENCES entity(id),
   FOREIGN KEY(bonus) REFERENCES BM(id)
);

CREATE TABLE tribebelong(
   entity UUID,
   tribe UUID,
   jobtitle VARCHAR(255)  NOT NULL,
   datejoin DATETIME NOT NULL,
   PRIMARY KEY(entity, tribe),
   FOREIGN KEY(entity) REFERENCES entity(id),
   FOREIGN KEY(tribe) REFERENCES tribe(id)
);

CREATE TABLE positionobject(
   instance UUID,
   object UUID,
   x INT NOT NULL,
   y INT NOT NULL,
   n INT NOT NULL,
   quantity INT NOT NULL,
   PRIMARY KEY(instance, object),
   FOREIGN KEY(instance) REFERENCES gameworld(id),
   FOREIGN KEY(object) REFERENCES object(id)
);

CREATE TABLE costbuild(
   buildingtype UUID,
   objecttype UUID,
   quantity INT NOT NULL,
   PRIMARY KEY(buildingtype, objecttype),
   FOREIGN KEY(buildingtype) REFERENCES buildingtype(id),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id)
);

CREATE TABLE affinityforprofessions(
   profession UUID,
   affinity VARCHAR(2) ,
   PRIMARY KEY(profession, affinity),
   FOREIGN KEY(profession) REFERENCES profession(id),
   FOREIGN KEY(affinity) REFERENCES affinity(code)
);

CREATE TABLE prerequisitedprofession(
   profession UUID,
   prerequisited VARCHAR(2) ,
   PRIMARY KEY(profession, prerequisited),
   FOREIGN KEY(profession) REFERENCES profession(id),
   FOREIGN KEY(prerequisited) REFERENCES prerequisited(code)
);

CREATE TABLE entityfeat(
   feat UUID,
   soul UUID,
   rank_ enum NOT NULL ('apprentice' ,'companion' , 'master' , 'grandmaster'),
   specialization VARCHAR(255)  NOT NULL,
   PRIMARY KEY(feat, soul),
   FOREIGN KEY(feat) REFERENCES feat(id),
   FOREIGN KEY(soul) REFERENCES soul(id)
);

CREATE TABLE recipeforcraft(
   objecttype UUID,
   recipe UUID,
   quantity INT NOT NULL,
   qualityminrequire enum ('poor', 'common', 'uncommon', 'rare', 'epic', 'legendary') DEFAULT 'common',
   levelmin INT,
   PRIMARY KEY(objecttype, recipe),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id),
   FOREIGN KEY(recipe) REFERENCES recipe(id)
);

CREATE TABLE servicebuilding(
   service UUID,
   building UUID,
   PRIMARY KEY(service, building),
   FOREIGN KEY(service) REFERENCES service(id),
   FOREIGN KEY(building) REFERENCES building(id)
);

CREATE TABLE contain(
   object UUID,
   building UUID,
   quantity INT NOT NULL,
   PRIMARY KEY(object, building),
   FOREIGN KEY(object) REFERENCES object(id),
   FOREIGN KEY(building) REFERENCES building(id)
);

CREATE TABLE featprerequisited(
   feat UUID,
   prerequisited VARCHAR(2) ,
   PRIMARY KEY(feat, prerequisited),
   FOREIGN KEY(feat) REFERENCES feat(id),
   FOREIGN KEY(prerequisited) REFERENCES prerequisited(code)
);

CREATE TABLE scribe(
   talent UUID,
   soul UUID,
   component UUID,
   location VARCHAR(20) ,
   PRIMARY KEY(talent, soul, component),
   FOREIGN KEY(talent) REFERENCES talent(id),
   FOREIGN KEY(soul) REFERENCES soul(id),
   FOREIGN KEY(component) REFERENCES component(id)
);

CREATE TABLE necessarytolearn(
   soul UUID,
   talent UUID,
   component UUID,
   quantity INT NOT NULL,
   PRIMARY KEY(soul, talent, component),
   FOREIGN KEY(soul, talent) REFERENCES knows(soul, talent),
   FOREIGN KEY(component) REFERENCES component(id)
);

CREATE TABLE composantenchantrequire(
   enchant UUID,
   component UUID,
   qualityminrequire enum ('poor', 'common', 'uncommon', 'rare', 'epic', 'legendary') DEFAULT 'common',
   PRIMARY KEY(enchant, component),
   FOREIGN KEY(enchant) REFERENCES enchantrequire(id),
   FOREIGN KEY(component) REFERENCES component(id)
);

CREATE TABLE aggrolevel(
   target UUID,
   actor UUID,
   level INT NOT NULL,
   update_ DATETIME NOT NULL,
   comment CHAR(255)  NOT NULL,
   PRIMARY KEY(target, actor),
   FOREIGN KEY(target) REFERENCES entity(id),
   FOREIGN KEY(actor) REFERENCES entity(id)
);

CREATE TABLE maketask(
   queststep UUID,
   souls UUID,
   PRIMARY KEY(queststep, souls),
   FOREIGN KEY(queststep) REFERENCES queststep(id),
   FOREIGN KEY(souls) REFERENCES soul(id)
);

CREATE TABLE itemreward(
   object UUID,
   reward UUID,
   quantity INT NOT NULL,
   PRIMARY KEY(object, reward),
   FOREIGN KEY(object) REFERENCES object(id),
   FOREIGN KEY(reward) REFERENCES reward(id)
);

CREATE TABLE receivenews(
   player UUID,
   news UUID,
   PRIMARY KEY(player, news),
   FOREIGN KEY(player) REFERENCES player(id),
   FOREIGN KEY(news) REFERENCES news(id)
);

CREATE TABLE objecttypematter(
   objecttype UUID,
   matter UUID,
   quantity INT NOT NULL,
   PRIMARY KEY(objecttype, matter),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id),
   FOREIGN KEY(matter) REFERENCES matter(id)
);

CREATE TABLE isenchanted(
   object UUID,
   enchant UUID,
   PRIMARY KEY(object, enchant),
   FOREIGN KEY(object) REFERENCES object(id),
   FOREIGN KEY(enchant) REFERENCES enchant(id)
);

CREATE TABLE entitydistinctions(
   entity UUID,
   distinctions UUID,
   dateobtain DATETIME NOT NULL,
   PRIMARY KEY(entity, distinctions),
   FOREIGN KEY(entity) REFERENCES entity(id),
   FOREIGN KEY(distinctions) REFERENCES distinctions(id)
);

CREATE TABLE talentininventory(
   talent UUID,
   talentinventory UUID,
   PRIMARY KEY(talent, talentinventory),
   FOREIGN KEY(talent) REFERENCES talent(id),
   FOREIGN KEY(talentinventory) REFERENCES talentinventory(id)
);

CREATE TABLE dietsobjecttype(
   objecttype UUID,
   diets UUID,
   PRIMARY KEY(objecttype, diets),
   FOREIGN KEY(objecttype) REFERENCES objecttype(id),
   FOREIGN KEY(diets) REFERENCES diets(id)
);

CREATE TABLE responseannoucement(
   id UUID,
   id_1 UUID,
   name VARCHAR(255)  NOT NULL,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES player(id),
   FOREIGN KEY(id_1) REFERENCES announcement(id)
);
