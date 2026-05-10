function [AR, wR] = analyseFrequenzgang(betrag, kreisfrequenz)

    A0 = betrag(1);
    [A_max, index] = max(betrag);

    AR = (A_max / A0) - 1;
    wR = kreisfrequenz(index);
end
