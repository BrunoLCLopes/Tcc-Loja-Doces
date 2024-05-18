const int l = 1, d = 0;

int unidades[] = {0, 1, 2, 3, 4, 5, 6};
int dezenas[] = {7, 8, 9, 10, 11, 12, 13};

byte digito[10][7] = { 
    { l,l,l,l,l,l,d },  //DIGITO 0
    { d,l,l,d,d,d,d },  //DIGITO 1
    { l,l,d,l,l,d,l },  //DIGITO 2
    { l,l,l,l,d,d,l },  //DIGITO 3
    { d,l,l,d,d,l,l },  //DIGITO 4
    { l,d,l,l,d,l,l },  //DIGITO 5
    { l,d,l,l,l,l,l },  //DIGITO 6
    { l,l,l,d,d,d,d },  //DIGITO 7
    { l,l,l,l,l,l,l },  //DIGITO 8
    { l,l,l,d,d,l,l }   //DIGITO 9
};

const int SEGMENTOS = 7;
const int NUMEROS = 10;

int dezena = 0;
int unidade = 0;
bool pausado = false;
bool ascendendo = true;
unsigned long startTime = 0;

void setup() {
    for (int i = 0; i < SEGMENTOS; i++) {
        pinMode(dezenas[i], OUTPUT);
        pinMode(unidades[i], OUTPUT);
    }
}

void loop() {
    if (!pausado) {
        if (ascendendo) {
            acende(dezenas, dezena);
            acende(unidades, unidade);
            delay(100);

            unidade++;
            if (unidade > 8) {
                unidade = 0;
                dezena++;
                if (dezena > 8) {
                    if (dezena == 9 && unidade == 0) {
                        pausado = true;
                        startTime = millis();
                        ascendendo = false;
                    }
                    dezena = 8;
                }
            }
        } else {
            acende(dezenas, dezena);
            acende(unidades, unidade);
            delay(150);

            unidade--;
            if (unidade < 0) {
                unidade = 8;
                dezena--;
                if (dezena < 0) {
                    pausado = false;
                    ascendendo = true;
                    dezena = 0;
                }
            }
        }
    } else {
        if (millis() - startTime >= 4000) {
            pausado = false;
            ascendendo = false;
        }
    }
}

void acende(int* pino, int dig) {
    for (int i = 0; i < SEGMENTOS; i++) {
        digitalWrite(pino[i], digito[dig][i]);
    }
}
