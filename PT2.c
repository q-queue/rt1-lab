/*  Laborversuch Regelungstechnik 1: Analoge und Digitale Regler
    (C) 2015-2019 W.Lindermeir, W.Zimmermann

    Hochschule Esslingen
    Autoren:   W. Lindermeir und W. Zimmermann

    Beispielprogramm     PT2.c

    Programmieren von Regelalgorithmen in C/C++

    Vorbereitungsfrage 9
    C-Programm für PT2-Block

    Übersetzen mit       mex pt2.c              Eingabe von der Matlab-Kommandozeile aus

    Testen mit           C_PT2_test.slx         Simulink-Blockschaltbild

    Hinweis:             Falls der C/C++-Compiler noch nicht fuer Matlab konfiguriert ist,
                         vor dem Übersetzen 'mex -setup' aufrufen.
*/

#define S_FUNCTION_NAME PT2                     // Dateiname ohne ".c", hier PT2
#define NO_PARAMETERS 1                         // ein Parameter aus Simulink-Maske
#define S_FUNCTION_LEVEL 2
#include "simstruc.h"

typedef double SIGNAL;                          // Typdefinition für Signale und Variable
typedef const double PARAM;                     // Typdefinition für Parameter

void S_FUNCTION_NAME(SIGNAL e, SIGNAL *u, int init, SimStruct *S);
#include "Sblock.h"                             // Header für das Simulink-C-Interface


// PT2 Glied mit v=1; D=.5; T_0=.1  bei einer Abtastzeit von T=.01
void S_FUNCTION_NAME(SIGNAL e, SIGNAL *u, int init, SimStruct *S)
{       static SIGNAL   ek_1, ek_2,             // Gespeicherte Werte e(k-1), . . ., u(k 2)
                        uk_1, uk_2;
        PARAM           b0 =  0,                // Parameter des PT2-Glieds b0, . . ., a2
                        b1 =  0.0044,
                        b2 =  0.0038,
                        a1 = -1.6621,
                        a2 =  0.6703;
        if (init)                                       // Initialisierung der Anfangswerte
        {       *u = uk_1 = uk_2 = ek_1 = ek_2 = 0;
        }  else                                         // Berechnung des Ausgangssignals
        {       *u =    b0 * e + b1 * ek_1 + b2 * ek_2 - a1 * uk_1 - a2 * uk_2;
                ek_2 = ek_1;                            // Abspeichern von e(k-1), .., u(k-2);
                ek_1 = e;
                uk_2 = uk_1;
                uk_1 = *u;
        }
}
