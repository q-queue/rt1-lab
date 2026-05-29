/*  Laborversuch Regelungstechnik 1: Analoge und Digitale Regler
    (C) 2015-2019 W.Lindermeir, W.Zimmermann

    Hochschule Esslingen

    Beispielprogramm     PI.c

    Programmieren von Regelalgorithmen in C/C++

    Vorbereitungsfrage 9
    C-Programm für PI-Block

    Übersetzen mit       mex PI.c              Eingabe von der Matlab-Kommandozeile aus

    Testen mit           C_PI_test.slx         Simulink-Blockschaltbild

    Hinweis: Falls der C/C++-Compiler noch nicht fuer Matlab konfiguriert ist,
             vor dem Übersetzen 'mex -setup' aufrufen.
*/

#define S_FUNCTION_NAME PI                      // Dateiname ohne ".c", hier PT2
#define NO_PARAMETERS 1                         // ein Parameter aus Simulink-Maske
#define S_FUNCTION_LEVEL 2
#include "simstruc.h"

typedef double SIGNAL;                          // Typdefinition für Signale und Variable
typedef const double PARAM;                     // Typdefinition für Parameter

void S_FUNCTION_NAME(SIGNAL e, SIGNAL *u, int init, SimStruct *S);
#include "Sblock.h"                             // Header für das Simulink-C-Interface

void S_FUNCTION_NAME(SIGNAL e, SIGNAL *u, int init, SimStruct *S)
{

	// Parameter des PI-Glieds
	PARAM
		Kp = 1.0,
		Tn = 0.1;

	static SIGNAL u_i;    // Gespeicherte Werte u(k-1)
	static SIGNAL T;

	if (init)             // Initialisierung der Anfangswerte
	{
		T = *mxGetPr(ssGetSFcnParam(S, 0));
		*u = u_i = 0.0;
		return;
	}

	SIGNAL u_p;

	// Berechnung des Ausgangssignals

		u_p  = Kp * e;
		u_i += Kp * T / Tn * e;
		*u   = u_p + u_i;
}
