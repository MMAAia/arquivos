#include <iostream>
#include <stdio.h>
#include <string.h>

#pragma pack(1)

struct _Registro {
    int id_inscricao;
    char curso[20];
    char cpf[15];
    char dataNascimento[11];
    char sexo;
    char email[40];
    char opcaoQuadro;
};	typedef struct _Registro Registro;

void printEmail(Registro* r) {
    printf("Email: %.40s\n", r->email)  ;
}

int compara(const void* r1, const void* r2)
{
    return ((Registro*)r1)->id_inscricao > ((Registro*)r2)->id_inscricao;
}


int main() {
    FILE* candidatosA, * candidatosB;
    Registro registroA, registroB;
    long count = 0, qtdA, qtdB;
    int contador = 0;
    candidatosA = fopen("C:/Users/labma/Desktop/Org. e Estrutura de Arquivos/Lista1_Resolucoes/Questao_3/candidatosA.dat", "rb");
    candidatosB = fopen("C:/Users/labma/Desktop/Org. e Estrutura de Arquivos/Lista1_Resolucoes/Questao_3/candidatosB.dat", "rb");
    
    qtdA = fread(&registroA, sizeof(Registro), 1, candidatosA);

    while (qtdA > 0) {
        qtdB = fread(&registroB, sizeof(Registro), 1, candidatosB);

        while (qtdB > 0) {
            if (strcmp(registroA.cpf, registroB.cpf) == 0) {
                printEmail(&registroA);
                break;
            }
            qtdB = fread(&registroB, sizeof(Registro), 1, candidatosB);
        }
        fseek(candidatosB, 0, SEEK_SET);
        qtdA = fread(&registroA, sizeof(Registro), 1, candidatosA);
    }

    fclose(candidatosA);
    fclose(candidatosB);
}
