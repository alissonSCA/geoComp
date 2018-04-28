function inte = intersepta(A,B,C,D)
    v11 = somavetorial(B, multescalar(-1, A)); % v11 = B - A (vetor AB)
    v12 = somavetorial(C, multescalar(-1, A)); % v12 = C - A (vetor AC)
    v13 = somavetorial(D, multescalar(-1, A)); % v13 = D - A (vetor AD)

    v21 = somavetorial(D, multescalar(-1, C)); % v21 = D - C (vetor CD)
    v22 = somavetorial(A, multescalar(-1, C)); % v22 = C - A (vetor CA)
    v23 = somavetorial(B, multescalar(-1, C)); % v23 = D - A (vetor CB)

    r1 = prodvetorial([v11,0], [v12,0]);
    r2 = prodvetorial([v11,0], [v13,0]);
    r3 = prodvetorial([v21,0], [v22,0]);
    r4 = prodvetorial([v21,0], [v23,0]);

    inte = ((r1(3)*r2(3)<0) && (r3(3)*r4(3)<0));
    
end