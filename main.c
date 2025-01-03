
// #include <errno.h>
#include <stdio.h>
// #include <string.h>

#include "ast.h"
#include "parser.h"
#include "scanner.h"

int main(int argc, char** argv) {

    if(argc < 2) {
        printf("syntax: %s filename\n", argv[0]);
        return 1;
    }

//     init_scanner(argv[1]);
//     for(token_t* tok = get_token(); tok->type != END_OF_INPUT; tok = consume_token()) {
//         printf("%s: %s: %s\n", tok_type_to_str(tok), tok->text, tok->name);
//     }
//     return 0;

    void* ast = parse(init_parser(argv[1]));

    traverse_ast(ast, NULL);

    uninit_scanner();
    return 0;
}
