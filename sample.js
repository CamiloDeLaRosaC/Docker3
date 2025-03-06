function catalan(n) {
    const cat = new Array(n + 1).fill(0);
    cat[0] = 1;
    for (let i = 1; i <= n; i++) {
      for (let j = 0; j < i; j++) {
        cat[i] += cat[j] * cat[i - j - 1];
      }
    }
    return cat[n];
  }
  
  function main() {
    const N = 30;
    const start = performance.now();
    for (let i = 0; i < N; i++) {
      console.log(`C(${i}) = ${catalan(i)}`);
    }
    const end = performance.now();
    console.log(`Tiempo de ejecución (en JavaScript): ${(end - start).toFixed(2)} ms`);
  }
  
  main();