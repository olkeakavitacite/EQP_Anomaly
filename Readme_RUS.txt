EQP_Anomaly ver 1.8.0 [TEST.RELEASE] 18.01.2016 23:46 GMT+6
About:  Данный проект, своей целью ставит преврать бездумное убиваение мобов малолетками, в более интересное для взрослых занятие, а именно внести ролевой компонент (аля Altis.Life)
Почему именно в стиле сталкера. Я не играл в сталкер, но мне нравятся книги из всленной S.T.A.L.K.E.R. поэтому я воспринимаю ЗОНУ несколько иначе, чем игроки, ну и просто тематика мне нравится. Как-то взял нарисовал аномалии и пошло...
Итак. Пока только первая ветка, но я уже веду работу над второй. 
В трех трейд зонах, стоит квестовые НПС, которые дают задания изучить различные аномалии, за выполнение задания дают респект и уважуху (pop tabs). Зовут нпс Василий Обухов, Иван Демидов и Борис Бритва. Почему так? Я выложил вначале английскую версию и просто хотел постебаться. 
Что в новой версии. 
CHANGE LOG 1.81 (18.01.2016)
1) Я сделал проверку на взятие квеста, потому что без нее ушлые игроки были нашли способ дюпать опыт на квесте, путем перекладывания квестовых предметов в машину, теперь не прокатывает, т.к. каждый раз когда берется квест - сбрасывает чек.
2) Теперь на карте НПС помечены красными кружками, потомучто без них их хер найдешь....
3) Изменил содержание квестов и ребаланс с багфиксами..

Известные баги: Предмет должен лежать в инвентаре, если он попадает в рюкзак, то не виден оттуда квесту, пока попытки сделать это по реккомендации пользователей с Exile.com успеха не дали. Как реккомендуют не пашет. Но особо игрков это не напрягает.
Баг с отсутствием текстуры на земле у порножурнала - выдает сообщение игрку об отсутсвтующей текстуры... не фиксится, пока не пофикся в Exile. 
Баг с дюпом - пофикшен.

Устновка. 
pbomanager, notepad++ or farmanager
2) Распаковаываем вашу миссию.. я ее обратно не запакоываю т.к. не вижу смысла, но если вам нравится гонять туда сюда, обратно ...
   Копируем папку   /Exile.Altis/EQP_Anomaly к себе в миссию по аналогичноему пути /Mpmission/Exile.Altis/EQP_Anomaly/
3) Качаем звуки для аномалий (теперь у каждой свой) https://yadi.sk/d/f7NcLeHznHLcx (звуки хотел скомуниздить у RATS ну а че они у меня графику я у них звуки... но потом совесть замучала и накачал сам. Пак со звуками забираем с яндекса.
и пихаем сюда Arma3Server/Mpmission/Exile.Altis/EQP_Anomaly/snd/..
6) В вашем description.ini всталем после
allowFunctionsRecompile = 0;

////////////////////////////////////////  AND INSERT IF ANYWERE IN YOU NOT HAVE CfgSounds in DESCRIPTION
class CfgSounds
{
/////// IF YOU HAVE CfgSound block INSERT this
class anm
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "anm";
    // filename, volume, pitch
    sound[] = {"EQP_Anomaly\snd\anm.ogg", 1, 1};
    titles[] = {};
};
class meat
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "meat";
    // filename, volume, pitch
    sound[] = {"EQP_Anomaly\snd\meat.ogg", 1, 1};
    // subtitle delay in seconds, subtitle text 
    titles[] = {};
};
class ffluff
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "ffluff";
    // filename, volume, pitch
    sound[] = {"EQP_Anomaly\snd\ffluff.ogg", 1, 1};
    // subtitle delay in seconds, subtitle text 
    titles[] = {};
};
class gravi
{
    // how the sound is referred to in the editor (e.g. trigger effects)
    name = "gravi";
    // filename, volume, pitch
    sound[] = {"EQP_Anomaly\snd\gravi.ogg", 1, 1};
    // subtitle delay in seconds, subtitle text 
    titles[] = {};
};

/////// IF YOU HAVE CfgSound block INSERT this
};
////////////////////////////////////////  INSERT IF ANYWERE IN YOU NOT HAVE CfgSounds in DESCRIPTION

и выше линии  #include "config.cpp"
Надеюсь понятно, что если у вас уже есть CfgSound то вставляем только class-ы

7) Меняем init.sqf (если у вас его нет то создайте)

// Включает маркеры на карте
USE_MARKER = true; 
// Чекает квесты чтобы не дюпали это менять по должно быть всегда FALSE 
SET_QUEST1 = FALSE;
SET_QUEST2 = FALSE;
SET_QUEST3 = FALSE;

//  Запускае файл который рисует маркеры
_nul = execVM "EQP_Anomaly\search.sqf";


8) Идем в mission.sqm до строки 1034 находим блок
            class Item99
            {
                position[]={13239.08,16.010651,11685.795};
                special="NONE";
                id=99;
                side="GUER";
                vehicle="Exile_Unit_GhostPlayer";
                player="PLAY CDG";
                skill=0.60000002;
            };
        };
    };
};
// и после последней  ;) пихаем блок от сель
//--------------------------------------- START INSERT THIS CODE------------------------------------------------------------
//TODO NPC BLOCK FOR ANOMALY ACTIVITY QUEST
    class Vehicles
    {
        items=3;
        class Item0
        {
            position[]={14642.1,0,16888.2}; // Altis Airport safe zone trader Basil Obuhoiv
            azimut=135;
            id=1;
            side="CIV";
            vehicle="C_Nikos";
            leader=1;
            skill=0.60000002;
            init= "this addAction[""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest.sqf""];";
    };
    class Item1
    {
        position[]={23332.1,0,24165.4}; // East zone Ivan Demivod
        azimut=135;
        id=1;
        side="CIV";
        vehicle="C_man_p_beggar_F_euro";
        leader=1;
        skill=0.60000002;
        init= "this addAction[""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest2.sqf""];";
    };
    class Item2
    {
        position[]={3031.86,0,18148.8}; // West zone Boris Britva
        azimut=310;
        id=1;
        side="CIV";
        vehicle="B_Soldier_F";
        leader=1;
        skill=0.60000002;
        init="comment ""Remove existing items"";  removeAllWeapons this;  removeAllItems this;  removeAllAssignedItems this;  removeVest this;  removeBackpack this;  removeHeadgear this;  removeGoggles this; comment ""Add containers"";  this   addHeadgear ""H_HelmetCrew_I"";  comment ""Add weapons"";  this addWeapon ""srifle_DMR_04_Tan_F"";  this addPrimaryWeaponItem ""acc_flashlight"";  this addPrimaryWeaponItem ""optic_KHS_tan"";  this addPrimaryWeaponItem ""bipod_02_F_tan"";  this addWeapon ""hgun_Pistol_heavy_01_F"";  this addHandgunItem ""muzzle_snds_acp"";  this addHandgunItem ""optic_MRD"";  this addWeapon ""Laserdesignator_02"";    comment ""Add items"";  this linkItem ""ItemMap"";  this linkItem ""ItemCompass"";  this linkItem ""ItemWatch"";  this linkItem ""ItemGPS"";  this linkItem ""NVGoggles_INDEP""; this addAction [""<t color='#068600'>ANOMALY ACTIVITY QUEST</t>"",""EQP_Anomaly\quest3.sqf""];";
    };
};
class Sensors
{
    items=6;
    class Item0
    {
        position[]={14514.4,0,17005.1}; // point 10m around Altis Airport safe zone
        a=10;
        b=10;
        angle=14.143009;
        activationBy="ANY";
        interruptable=1;
        age="UNKNOWN";
        expCond="true";
        expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\gravi.sqf""";
        class Effects
        {
        };
    };
    class Item1
    {
        position[]={14514.4,0,17005.1};
        a=30;
        b=30;
        activationBy="ANY";
        repeating=1;
        interruptable=1;
        age="UNKNOWN";
        name="rad1_2";
        expCond="(vehicle player) in thislist;";
        expActiv="init = execVM ""EQP_Anomaly\detect.sqf"";";
        class Effects
        {
        };
    };
    class Item2
    {
        position[]={23393.9,0,24411.1}; // point 10m around Altis Airport safe zone
        a=10;
        b=10;
        angle=14.143009;
        activationBy="ANY";
        interruptable=1;
        age="UNKNOWN";
        expCond="true";
        expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\meat.sqf""";
        class Effects
        {
        };
    };
    class Item3
    {
        position[]={23393.9,0,24411.1};
        a=30;
        b=30;
        activationBy="ANY";
        repeating=1;
        interruptable=1;
        age="UNKNOWN";
        name="rad1_2";
        expCond="(vehicle player) in thislist;";
        expActiv="init = execVM ""EQP_Anomaly\detect2.sqf"";";
        class Effects
        {
        };
    };
    class Item4
    {
        position[]={2909.41,0,18351.6}; // point 10m around Altis Airport safe zone
        a=10;
        b=10;
        angle=14.143009;
        activationBy="ANY";
        interruptable=1;
        age="UNKNOWN";
        expCond="true";
        expActiv="XC=[thistrigger,10]execvm ""EQP_Anomaly\fluff.sqf""";
        class Effects
        {
        };
    };
    class Item5
    {
        position[]={2909.41,0,18351.6};
        a=30;
        b=30;
        activationBy="ANY";
        repeating=1;
        interruptable=1;
        age="UNKNOWN";
        name="rad1_2";
        expCond="(vehicle player) in thislist;";
        expActiv="init = execVM ""EQP_Anomaly\detect3.sqf"";";
        class Effects
        {
        };
    };
};
// и до сель...---------------------------------------- END INSERT THIS ------------------------------------------------------------
// Так чтобы он уперся в начала класса Markers.. 
9) Копируем для руссфикации (если надо) повех с заменой файлы из EQP_Anomaly_RUS в EQP_Anomaly
