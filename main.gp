printmessage(m) = print(concat([Str(x)|x<-m]));
[N, k, c] = readvec("input.txt");


baseM(b, c) = {
    my(base, i, n);

    n = #b + 1;
    base = matid(n);
    for(i = 1, n-1,
        base[i, n] = -b[i];
    );
    base[n, n] = c;

    return(base);

}


test() = {

    n = #k;

    \\ on transforme le problème en base de reseau
    baseM = baseM(k, c);

    b = qflll(baseM);

    print(b);


    for(i=1, n,
        res = 0;
        for(j = 1, n,
            res += b[i, j]*k[j];
        );
        if(res == c, return(b));
    );
    return(res);

}

main() = {

  print(test());

}

main();
