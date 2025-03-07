#include <iostream>
#include <vector>
#include <chrono>

using namespace std;

long long catalan(int n) {
    vector<long long> cat(n+1, 0);
    cat[0] = 1;
    for(int i = 1; i <= n; i++){
        for(int j = 0; j < i; j++){
            cat[i] += cat[j] * cat[i-j-1];
        }
    }
    return cat[n];
}

int main(){
    const int N = 30;
    auto start = chrono::high_resolution_clock::now();

    for(int i = 0; i < N; i++){
        cout << "C(" << i << ") = " << catalan(i) << endl;
    }

    auto end = chrono::high_resolution_clock::now();
    auto duration = chrono::duration_cast<chrono::microseconds>(end - start);

    cout << "Tiempo de ejecución (en C++): " << duration.count() / 1000.0 << " ms" << endl;
    return 0;
}