Shapa: SHAcho {Pa, Pi, Pu, Pe, Po}co Assembler
========

```
SCRIPT  : SHAcho {Pa,Pi,Pu,Pe,Po}co Assembler Ver.2.011
AUTHOR  : Yoshiki Saito

USAGE   :  ./shapa [OPTION(s)] {SRC_FILE,ASCII(s),NUM(s)}
        --arch PARAM_FILE  : Set parameter file name to PARAM_FILE.
        -o DST_FILE        : Set output file name to DST_FILE.
                           :   Default name is ENV['SHAPA_DEFOUT'] or 'a.out'.
        -m                 : Generate mnemonic file from binary file
                           :   Maybe useful for debugging??
                           :   Be careful if the name of the binary file is 'a.out' and -o option is not set.
                           :   The binary file will be overwritten.
        -h HEAD_FILE       : Concat HEAD_FILE at the begining of the output file.
                           :   Maybe useful for SFL??.
        -t TAIL_FILE       : Concat TAIL_FILE at the end of the output file.
                           :   Maybe useful for SFL??.
        --no_src           : Generate binary file or mnemonic file with no source code commented out.
        --fpga             : Generate binary file following to the FPGA format.
        -n NUM(s)          : Translate NUM(s) to binary, oct, decimal and hex.
                           :   NUM can be binary, oct, decimal or hex.
                           :   Binary, Oct, and Hex starts from '0b', '0' and '0x', respectively.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m', '-a', '--a2b', '--a2o', '--a2d', '--a2h'
                           :   will be ignored.
        -b BIT_NUM         : Change default bit_num to BIT_NUM.
                           :   Used with '-n' option for translating values
                           :   to bin, oct, dec or hex.
        -s signed/unsigned : Set default singed/unsigned.
                           :   Used with '-n' option for translating values
                           :   to bin, oct, dec or hex.
                           :   Default setting is 'signed'.
        -a ASCII(s)        : Translate ASCII(s) to binary, oct, decimal, hex.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m' will be ignored.
        --a2b ASCII(s)     : Translate ASCII(s) to binary.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m' will be ignored.
        --a2o ASCII(s)     : Translate ASCII(s) to oct.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m' will be ignored.
        --a2d ASCII(s)     : Translate ASCII(s) to decimal.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m' will be ignored.
        --a2h ASCII(s)     : Translate ASCII(s) to hex.
                           :   No assembling will be done,
                           :   and option '--arch', '-o', '-m' will be ignored.
        --addon ADDON_FILE : Load ADDON_FILE as an addon script.
        --debug            : Set debug mode on.
        --history          : Display history (bug reports, etc)
        --help             : Display this message, and do nothing.
        --version          : Display version, and do nothing.
```

