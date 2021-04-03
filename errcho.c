#include <stdio.h>
#include <stdbool.h>
#include <string.h>

#define NONEWLINE_OPT   "-n"

/* usage: prog [-n] [string [string ...]] */
int
main(int argc,
     char **argv) {
        const char *prog_name = argv[0];
        argv++;
        argc--;

        bool has_newline = true; // flag if newline is to be printed
        /* option to turn off newline must be first arg */
        if ((argc > 0) && (strcmp(argv[0], NONEWLINE_OPT) == 0)) {
                has_newline = false;
                argv++;
                argc--;
        }

        /* print all remaining args */
        while (argc > 0) {
                fputs(argv[0], stderr);
                argv++;
                argc--;
                /* don't print a space after last arg */
                if (argc > 0) {
                        fputc(' ', stderr);
                }
        }
        /* print newline if desired */
        if (has_newline) {
                fputc('\n', stderr);
        }

        return 0;
}
