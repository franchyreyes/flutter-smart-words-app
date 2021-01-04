import 'package:findwords/model/category.dart';
import 'package:findwords/model/language.dart';
import 'package:findwords/model/quiz.dart';
import 'package:findwords/model/quiz_detail.dart';

class RandomLanguageGenerator {
  static final _languages = [
    Language(locale: 'es', documentID: "1mBamT7MOT9B2StJ0RcR"),
    Language(locale: 'en', documentID: "xgu77VtAk4YE3iiMTiyv"),
  ];

  static Language getRandomLanguage(int length) {
    return _languages[length];
  }
}


class RandomCategoryGenerator {
  static final _categories = [
    Category(name: 'Fruits', documentID: "5wEm02Ow6r7EHomiaUdN", img: "fruits.png", code: 1),
    Category(name: 'Things', documentID: "K5l23p69jgobKRWDRV0V", img: "hang-clothes.png", code: 2),
    Category(name: 'Sports', documentID: "Uqt4GJn7POyGXUqp8i4U", img: "sports.png", code: 3),
    Category(name: 'Animals', documentID: "x3JeNeZHJFCk2nLZ1MMm", img: "cocker-spaniel.png", code: 4),
    Category(name: 'Body', documentID: "y9dWaesu0Dqp9zGaWQ30", img: "nervous-system.png", code: 5),
    Category(name: 'All', documentID: "Kx83tRNDC8QG4QBI4Ld4", img: "expand.png", code: 6),

  ];

  static Category getRandomCategory(int length) {
    return _categories[length];
  }
}


class RandomQuizGenerator {
  static final _quiz = [
    Quiz(
        documentID: "7Gax3pSD2s2WtSihDZX5",
        categoryID: "K5l23p69jgobKRWDRV0V",
        languageID: "1mBamT7MOT9B2StJ0RcR",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Gotas de agua que caen de las nubes",completed: false,answer: "lluvia"),
          QuizDetail(number: 2,question:  "La persona que tiene la posición política más alta de un país.",completed: false,answer: "presidente"),
          QuizDetail(number: 3,question:  "Alguien que presenta programas o lee las noticias en la televisión o la radio.",completed: false,answer: "locutor"),
          QuizDetail(number: 4,question:  "Un sistema de comunicación que consta de sonidos, palabras y gramática, o el sistema de comunicación utilizado por las personas en un país o tipo de trabajo en particular.",completed: false,answer: "idioma"),
          QuizDetail(number: 5,question:  "un área de tierra que tiene su propio gobierno, ejército, etc",completed: false,answer: "pais"),
          QuizDetail(number: 6,question:  "un líquido claro, sin color ni sabor",completed: false,answer: "agua"),
          QuizDetail(number: 7,question:  "Una actividad para la que una persona utiliza un esfuerzo físico o mental, generalmente por dinero",completed: false,answer: "trabajo"),
          QuizDetail(number: 8,question:  "Un dibujo que le brinda un tipo particular de información sobre un área en particular.",completed: false,answer: "mapa"),
          QuizDetail(number: 9,question:  "Objeto largo y delgado que se usa para escribir o dibujar con tinta.",completed: false,answer: "lapicero"),
          QuizDetail(number: 10,question: "Cualquier lugar de educación especializada después de los 16 años donde las personas estudian o se capacitan para adquirir conocimientos y / o habilidades.",completed: false,answer: "universidad"),
          QuizDetail(number: 11,question: "Algo que las personas y los animales comen, o que las plantas absorben, para mantenerlos con vida.",completed: false,answer: "comida"),
          QuizDetail(number: 12,question: "Una pieza de equipo electrónico que le permite hablar con alguien en otro lugar que tenga un equipo similar, utilizando señales eléctricas enviadas a través de un sistema de cables o señales de radio.",completed: false,answer: "telefono"),
          QuizDetail(number: 13,question: "Un conjunto de letras dispuestas en un orden fijo, que se utiliza para escribir un idioma.",completed: false,answer: "alfabeto"),
          QuizDetail(number: 14,question: "Una pieza de vidrio curvado que hace que los objetos parezcan más grandes de lo que son",completed: false,answer: "lupa"),
          QuizDetail(number: 15,question: "Varias personas o animales que hacen algo juntos como grupo",completed: false,answer: "equipo"),
          QuizDetail(number: 16,question: "Uno de un par de cubiertas para sus pies, generalmente hechas de un material resistente como el cuero.",completed: false,answer: "zapato"),
          QuizDetail(number: 17,question: "Algo usado como símbolo de éxito",completed: false,answer: "trofeo"),
          QuizDetail(number: 18,question: "Un objeto plano que se usa para cerrar la entrada de algo como una habitación o edificio, o la entrada misma",completed: false,answer: "puerta"),
          QuizDetail(number: 19,question: "La estrella que proporciona luz y calor a la tierra y alrededor de la cual se mueve la tierra.",completed: false,answer: "sol"),
          QuizDetail(number: 20,question: "Cualquier objeto en forma de esfera, especialmente uno utilizado como juguete por los niños o en diversos deportes como el tenis y el fútbol.",completed: false,answer: "pelota"),
        ]
    ),
    Quiz(
        documentID: "DPyGQVwOcGj7ckAid9oh",
        categoryID: "Uqt4GJn7POyGXUqp8i4U",
        languageID: "1mBamT7MOT9B2StJ0RcR",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Un deporte en el que dos competidores luchan golpeándose entre sí, generalmente con guantes protectores.",completed: false,answer: "boxeo"),
          QuizDetail(number: 2,question:  "Un juego jugado por dos equipos de cinco jugadores que suman puntos lanzando una pelota grande a través de una red abierta que cuelga de un anillo de metal.",completed: false,answer: "baloncesto"),
          QuizDetail(number: 3,question:  "Un juego jugado entre dos equipos de once personas, donde cada equipo intenta ganar pateando una pelota hacia la portería del otro equipo.",completed: false,answer: "futbol"),
          QuizDetail(number: 4,question:  "Un juego para dos equipos de once jugadores en el que una pelota ovalada se mueve por el campo corriendo con ella o lanzándola.",completed: false,answer: "futbol"),
          QuizDetail(number: 5,question:  "Un juego con dos equipos de nueve jugadores en el que una pelota, lanzada por un lanzador, es golpeada por un jugador con un bate que luego intenta correr alrededor de cuatro bases antes de ser detenido por el otro equipo.",completed: false,answer: "beisbol"),
          QuizDetail(number: 6,question:  "Un deporte en el que usas tus brazos y piernas, o a veces solo los brazos, para intentar forzar al otro competidor al suelo y mantener a esa persona ahí por un corto tiempo.",completed: false,answer: "lucha"),
          QuizDetail(number: 7,question:  "Un juego que se juega al aire libre sobre césped en el que cada jugador intenta golpear una bola pequeña en una serie de nueve o 18 hoyos pequeños, utilizando un palo largo y delgado.",completed: false,answer: "golf"),
          QuizDetail(number: 8,question:  "Un juego que se juega entre dos o cuatro personas en un área de juego especial que consiste en golpear una pelota pequeña a través de una red central con una raqueta.",completed: false,answer: "tennis"),
          QuizDetail(number: 9,question:  "Un partido jugado en un campo deportivo entre dos equipos de once jugadores, cada uno con un palo curvo con el que intentan meter una pelota pequeña y dura en la portería del otro equipo.",completed: false,answer: "hockey"),
          QuizDetail(number: 10,question: "Un juego en el que dos equipos usan sus manos para golpear una pelota grande hacia atrás y hacia adelante sobre una red alta sin permitir que la pelota toque el suelo.",completed: false,answer: "voleibol"),
        ]
    ),

    Quiz(
        documentID: "DwEXvhopqOXO15ErhgVA",
        categoryID: "K5l23p69jgobKRWDRV0V",
        languageID: "xgu77VtAk4YE3iiMTiyv",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Drops of water that fall from clouds",completed: false,answer: "rain"),
          QuizDetail(number: 2,question:  "The person who has the highest political position in a country.",completed: false,answer: "president"),
          QuizDetail(number: 3,question:  "Someone who introduces programmes or reads the news on the television or radio.",completed: false,answer: "announcer"),
          QuizDetail(number: 4,question:  "A system of communication consisting of sounds, words, and grammar, or the system of communication used by people in a particular country or type of work",completed: false,answer: "language"),
          QuizDetail(number: 5,question:  "an area of land that has its own government, army, etc.:",completed: false,answer: "country"),
          QuizDetail(number: 6,question:  "a clear liquid, without colour or taste",completed: false,answer: "water"),
          QuizDetail(number: 7,question:  "an activity, that a person uses physical or mental effort to do, usually for money",completed: false,answer: "work"),
          QuizDetail(number: 8,question:  "A drawing that gives you a particular type of information about a particular area.",completed: false,answer: "map"),
          QuizDetail(number: 9,question:  "A long, thin object used for writing or drawing with ink.",completed: false,answer: "pen"),
          QuizDetail(number: 10,question: "Any place for specialized education after the age of 16 where people study or train to get knowledge and/or skills.",completed: false,answer: "college"),
          QuizDetail(number: 11,question: "Something that people and animals eat, or plants absorb, to keep them alive.",completed: false,answer: "food"),
          QuizDetail(number: 12,question: "A piece of electronic equipment which makes it possible for you to speak to someone in another place who has similar equipment, using either electrical signals sent along a system of wires, or radio signals",completed: false,answer: "phone"),
          QuizDetail(number: 13,question: "A set of letters arranged in a fixed order, used for writing a language",completed: false,answer: "alphabet"),
          QuizDetail(number: 14,question: "A piece of curved glass that makes objects look larger than they are",completed: false,answer: "magnifyingglass"),
          QuizDetail(number: 15,question: "A number of people or animals who do something together as a group:",completed: false,answer: "team"),
          QuizDetail(number: 16,question: "One of a pair of coverings for your feet, usually made of a strong material such as leather",completed: false,answer: "shoe"),
          QuizDetail(number: 17,question: "Something used as a symbol of success",completed: false,answer: "trophy"),
          QuizDetail(number: 18,question: "A flat object that is used to close the entrance of something such as a room or building, or the entrance itself",completed: false,answer: "door"),
          QuizDetail(number: 19,question: "The star that provides light and heat for the earth and around which the earth moves",completed: false,answer: "sun"),
          QuizDetail(number: 20,question: "Any object in the shape of a sphere, especially one used as a toy by children or in various sports such as tennis and football",completed: false,answer: "ball"),
        ]
    ),

    Quiz(
        documentID: "PJpv7fQhmdTEtrdVndwb",
        categoryID: "x3JeNeZHJFCk2nLZ1MMm",
        languageID: "1mBamT7MOT9B2StJ0RcR",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Soy un mamífero Normalmente vivo entre 9 y 20 años. y también vivo contigo en casa.",completed: false,answer: "perro"),
          QuizDetail(number: 2,question:  "Mi nombre científico es Ursidae. Estoy muy tranquilo pero no me hagas enojar.",completed: false,answer: "oso"),
          QuizDetail(number: 3,question:  "Vivo en los océanos. mis dientes son afilados y tienen la forma de una sierra ancha. Mi tamaño promedio  es de 4 a 7 metros.",completed: false,answer: "tiburon"),
          QuizDetail(number: 4,question:  "La cola representa casi el 50% de la longitud total y es el reptil vivo más grande y un depredador peligroso de los humanos.",completed: false,answer: "cocodrilo"),
          QuizDetail(number: 5,question:  "Dedican 20 horas diarias al descanso y la inactividad. Sus presas favoritas suelen ser los grandes mamíferos, la caza se realiza mediante ataques coordinados y en manadas, intentando aislar y asediar a la presa",completed: false,answer: "leon"),
          QuizDetail(number: 6,question:  "Son animales reptiles que carecen de patas y además son muy sensibles a las vibraciones",completed: false,answer: "serpiente"),
          QuizDetail(number: 7,question:  "Es un mamífero marino. Bajo el agua tienen un comportamiento solitario e independiente.",completed: false,answer: "foca"),
          QuizDetail(number: 8,question:  "Son herbívoros y también son nativos de África. Es el animal mas alto del mundo",completed: false,answer: "girafas"),
          QuizDetail(number: 9,question:  "Es un mamífero doméstico y tiene 4 patas. Necesitan grandes cantidades de agua potable y la esperanza de vida de estos animales es de 25 a 40 años.",completed: false,answer: "caballo"),
          QuizDetail(number: 10,question: "Son animales carnívoros. no les gusta compartir su comida y tienen garras muy afiladas pero retráctiles. no me gusta el agua",completed: false,answer: "gatos"),
        ]
    ),
    Quiz(
        documentID: "PL2UF04OC7VpnqiZGz32",
        categoryID: "Uqt4GJn7POyGXUqp8i4U",
        languageID: "xgu77VtAk4YE3iiMTiyv",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "A sport in which two competitors fight by hitting each other, usually wearing protective gloves",completed: false,answer: "boxing"),
          QuizDetail(number: 2,question:  "A game played by two teams of five players who score points by throwing a large ball through an open net hanging from a metal ring",completed: false,answer: "basketball"),
          QuizDetail(number: 3,question:  "A game played between two teams of eleven people, where each team tries to win by kicking a ball into the other team's goal",completed: false,answer: "soccer"),
          QuizDetail(number: 4,question:  "A game for two teams of eleven players in which an oval ball is moved along the field by running with it or throwing it",completed: false,answer: "football"),
          QuizDetail(number: 5,question:  "A game with two teams of nine players in which a ball, thrown by a pitcher, is hit by a player with a bat who then tries to run around four bases before being stopped by the other team.",completed: false,answer: "baseball"),
          QuizDetail(number: 6,question:  "A sport in which you use your arms and legs, or sometimes the arms only, to try to force the other competitor to the ground and hold that person there for a short time",completed: false,answer: "wrestling"),
          QuizDetail(number: 7,question:  "A game played outside on grass in which each player tries to hit a small ball into a series of nine or 18 small holes, using a long, thin stick",completed: false,answer: "golf"),
          QuizDetail(number: 8,question:  "A game played between two or four people on a special playing area that involves hitting a small ball across a central net using a racket",completed: false,answer: "tennis"),
          QuizDetail(number: 9,question:  "A game played on a sports field between two teams of eleven players who each have a curved stick with which they try to put a small, hard ball into the other team's goal",completed: false,answer: "hockey"),
          QuizDetail(number: 10,question: "A game in which two teams use their hands to hit a large ball backwards and forwards over a high net without allowing the ball to touch the ground",completed: false,answer: "volleyball"),
        ]
    ),

    Quiz(
        documentID: "bEmhJEJcxwbJCxOkeirQ",
        categoryID: "y9dWaesu0Dqp9zGaWQ30",
        languageID: "xgu77VtAk4YE3iiMTiyv",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "It is a part of the body that come in pairs, one on the right and one on the left.",completed: false,answer: "ears"),
          QuizDetail(number: 2,question:  "It is a part of the body that has curved hairs",completed: false,answer: "eyebrows"),
          QuizDetail(number: 3,question:  "It is a part of the body necessary for walking.",completed: false,answer: "hip"),
          QuizDetail(number: 4,question:  "Helps us gain speed and momentum when we are running",completed: false,answer: "arm"),
          QuizDetail(number: 5,question:  "Main functions are heating, humidifying and filtering the air.",completed: false,answer: "nose"),
          QuizDetail(number: 6,question:  "Allows us to maintain total stability and are vital for walking, running and jumping",completed: false,answer: "knees"),
          QuizDetail(number: 7,question:  "Allows us to make expressions without speaking",completed: false,answer: "eyes"),
          QuizDetail(number: 8,question:  "Support the body and allow its movement. Help keep the center of gravity stable",completed: false,answer: "Support"),
          QuizDetail(number: 9,question:  "Helps manipulate large objects with the palm of your hand",completed: false,answer: "thumb"),
          QuizDetail(number: 10,question: "Protects important organs such as the heart and lungs",completed: false,answer: "ribs"),
        ]
    ),

    Quiz(
        documentID: "iRNkHsj7J51sh52BQzsY",
        categoryID: "5wEm02Ow6r7EHomiaUdN",
        languageID: "1mBamT7MOT9B2StJ0RcR",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Estas frutas son rojas o verdes por fuera pero blancas por dentro. Tiene forma de globo, un poco hundido en sus extremos. Su sabor es entre agrio y dulce",completed: false,answer: "manzana"),
          QuizDetail(number: 2,question:  "Un fruto dulce, de forma alargada y curvada similar a un pepino.",completed: false,answer: "guineo"),
          QuizDetail(number: 3,question:  "Es una fruta que tiene forma redondeada. Se utiliza para elaborar vinos. Es dulce y contiene semillas negras.",completed: false,answer: "uvas"),
          QuizDetail(number: 4,question:  "Una fruta roja pequeña, jugosa, con forma de cono con semillas en su superficie",completed: false,answer: "fresa"),
          QuizDetail(number: 5,question:  "Una fruta que crece en las partes más calientes de la tierra, que tiene una forma ovalada, una semilla grande y una pulpa jugosa de color amarillo anaranjado",completed: false,answer: "mango"),
          QuizDetail(number: 6,question:  "Una fruta grande y jugosa que crece en regiones más cálidas, que tiene una piel áspera, un tallo corto y hojas puntiagudas en la parte superior, o su pulpa dulce y amarilla.",completed: false,answer: "piña"),
          QuizDetail(number: 7,question:  "Una fruta dulce, generalmente de piel verde y mucho jugo, que tiene una base redonda y está ligeramente puntiaguda hacia el tallo.",completed: false,answer: "pera"),
          QuizDetail(number: 8,question:  "Una fruta ovalada de color amarillo o verde cuyo jugo tiene un sabor amargo.",completed: false,answer: "limon"),
          QuizDetail(number: 9,question:  "Fruta grande y ovalada que crece en los árboles de las regiones más cálidas del mundo, con piel amarilla y pulpa naranja dulce",completed: false,answer: "lechosa"),
          QuizDetail(number: 10,question: "Una fruta grande con una cáscara dura, marrón y carne firme, blanca y comestible, o la pulpa blanca de esta fruta, que a veces se usa para cocinar.",completed: false,answer: "coco"),
        ]
    ),
    Quiz(
        documentID: "u8w4jj76kHg0ACFqUQsi",
        categoryID: "x3JeNeZHJFCk2nLZ1MMm",
        languageID: "xgu77VtAk4YE3iiMTiyv",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "I am a mammal. I usually live to around 9–20 years. and I also live with you at home.",completed: false,answer: "dog"),
          QuizDetail(number: 2,question:  "My scientific name is Ursidae. I am very calm but do not make me angry.",completed: false,answer: "bear"),
          QuizDetail(number: 3,question:  "I live in the oceans. my teeth are sharp and shaped like a wide saw. My average size is 4 to 7 meters.",completed: false,answer: "shark"),
          QuizDetail(number: 4,question:  "The tail represents almost 50% of the total length and he is the largest living reptile and a dangerous predator of humans",completed: false,answer: "crocodile"),
          QuizDetail(number: 5,question:  "They dedicate 20 hours a day to rest and inactivity. Their favorite prey are usually large mammals.The hunt takes place through coordinated attacks and in herds, trying to isolate and besiege the prey",completed: false,answer: "lion"),
          QuizDetail(number: 6,question:  "They are reptiles animals that lack legs and also are very sensitive to vibrations",completed: false,answer: "snake"),
          QuizDetail(number: 7,question:  "It is a marine mammal. Under water they have a solitary and independent behavior",completed: false,answer: "seal"),
          QuizDetail(number: 8,question:  "They are herbivorous and are also all native to Africa. It is the tallest animal in the world",completed: false,answer: "giraffes"),
          QuizDetail(number: 9,question:  "It is a domestic mammal and has 4 legs. They need large amounts of drinking water and the life expectancy of these animals is 25 to 40 years",completed: false,answer: "horse"),
          QuizDetail(number: 10,question: "They are carnivorous animals.  they don't like to share their food and  have claws that are very sharp but are retractable. do not like water",completed: false,answer: "cats"),
        ]
    ),

    Quiz(
        documentID: "v1800teYDU5G6N9pHlZS",
        categoryID: "5wEm02Ow6r7EHomiaUdN",
        languageID: "xgu77VtAk4YE3iiMTiyv",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "These fruits are red or green on the outside but white on the inside. It has a balloon shape, a bit sunken at its ends. Its flavor is between sour and sweet.",completed: false,answer: "apple"),
          QuizDetail(number: 2,question:  "A sweet fruits, with long and curved shape similar to a cucumber.",completed: false,answer: "banana"),
          QuizDetail(number: 3,question:  "It is a fruit that has a rounded shape. It is used to make wines. Is sweet and contains black seeds",completed: false,answer: "grapes"),
          QuizDetail(number: 4,question:  "A small, juicy, red fruit shaped like a cone with seeds on its surface",completed: false,answer: "strawberry"),
          QuizDetail(number: 5,question:  "A fruit grown in the hotter parts of the earth, having an oval shape, a large seed, and juicy, orange-yellow flesh",completed: false,answer: "mango"),
          QuizDetail(number: 6,question:  "A large, juicy fruit that grows in hotter regions, having a rough skin, a short stem, and pointed leaves on the top, or its sweet, yellow flesh",completed: false,answer: "pineapple"),
          QuizDetail(number: 7,question:  "A sweet fruit, usually with a green skin and a lot of juice, that has a round base and is slightly pointed towards the stem",completed: false,answer: "pear"),
          QuizDetail(number: 8,question:  "A yellow or green, oval fruit whose juice has a sour taste",completed: false,answer: "lemon"),
          QuizDetail(number: 9,question:  "A large, oval fruit that grows on trees in hotter regions of the world, having a yellow skin and sweet, orange flesh",completed: false,answer: "payaya"),
          QuizDetail(number: 10,question: "A large fruit with a hard, brown shell and firm, white, edible flesh, or the white flesh of this fruit, sometimes used in cooking.",completed: false,answer: "coconut"),
        ]
    ),
    Quiz(
        documentID: "yfXeRqin3T7zUKQvFkUv",
        categoryID: "y9dWaesu0Dqp9zGaWQ30",
        languageID: "1mBamT7MOT9B2StJ0RcR",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "Es una parte del cuerpo que viene en pares, uno a la derecha y otro a la izquierda.",completed: false,answer: "orejas"),
          QuizDetail(number: 2,question:  "Es una parte del cuerpo que tiene pelos curvados.",completed: false,answer: "cejas"),
          QuizDetail(number: 3,question:  "Es una parte del cuerpo necesaria para caminar.",completed: false,answer: "cadera"),
          QuizDetail(number: 4,question:  "Nos ayuda a ganar velocidad e impulso cuando corremos",completed: false,answer: "brazos"),
          QuizDetail(number: 5,question:  "Funciones principales son calentar, humedecer y filtrar el aire.",completed: false,answer: "nariz"),
          QuizDetail(number: 6,question:  "Nos permite mantener una estabilidad total y son vitales para caminar, correr y saltar.",completed: false,answer: "rodillas"),
          QuizDetail(number: 7,question:  "Nos permite hacer expresiones sin hablar.",completed: false,answer: "ojos"),
          QuizDetail(number: 8,question:  "Apoya el cuerpo y permite su movimiento. Ayuda a mantener estable el centro de gravedad.",completed: false,answer: "espalda"),
          QuizDetail(number: 9,question:  "Ayuda a manipular objetos grandes con la palma de tu mano.",completed: false,answer: "pulgar"),
          QuizDetail(number: 10,question: "Protege órganos importantes como el corazón y los pulmones.",completed: false,answer: "costillas"),
        ]
    )

  ];

  /*
  *
  * Quiz(
        documentID: "",
        categoryID: "",
        languageID: "",
        quizDetailsList: [
          QuizDetail(number: 1,question:  "",completed: false,answer: ""),
          QuizDetail(number: 2,question:  "",completed: false,answer: ""),
          QuizDetail(number: 3,question:  "",completed: false,answer: ""),
          QuizDetail(number: 4,question:  "",completed: false,answer: ""),
          QuizDetail(number: 5,question:  "",completed: false,answer: ""),
          QuizDetail(number: 6,question:  "",completed: false,answer: ""),
          QuizDetail(number: 7,question:  "",completed: false,answer: ""),
          QuizDetail(number: 8,question:  "",completed: false,answer: ""),
          QuizDetail(number: 9,question:  "",completed: false,answer: ""),
          QuizDetail(number: 10,question: "",completed: false,answer: ""),
        ]
    ),
  *
  * */

  static Quiz getRandomQuiz(int length) {
    return _quiz[length];
  }
}