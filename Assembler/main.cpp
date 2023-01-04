#include <iostream>
#include <string>
#include <stack>




class Assembler {

    private:

        std :: string instruction_text, machine_code;

    public:

        Assembler () {

            this -> instruction_text = this -> machine_code = "\0";

        }

        Assembler (std :: string& instruction_text) {

            this -> instruction_text = instruction_text;
            this -> machine_code = "\0";

        }

        void set_instruction_text (std :: string& instruction_text) {

            this -> instruction_text.clear();
            this -> instruction_text = instruction_text;
            return;

        }

        std :: string generate_machine_code () {        // "add $s0, $s1, $s2"

            this -> machine_code.clear();

            std :: string instruction_name = this -> generate_instuction_name();

            if (instruction_name == "add"
                || instruction_name == "sub"
                || instruction_name == "and"
                || instruction_name == "or") {

                this -> R_format (instruction_name);

            }

            else if (instruction_name == "lw"
                        || instruction_name == "sw"
                        || instruction_name == "beq") {

                this -> I_format(instruction_name);

            }

            else std :: cout << "Error!";

            return machine_code;

        }

        std :: string generate_instuction_name () {

            std :: string instruction_name = "\0";

            for (int i = 0; this -> instruction_text[i] != ' '; i++) {

                instruction_name += this -> instruction_text[i];

            }

            return instruction_name;

        }

        void R_format (std :: string& instruction_name) {

            this -> machine_code += "00";

            for (int i = 0; i < this -> instruction_text[i] != '\0'; i++) {

                if (this -> instruction_text[i] == '$') {

                    std :: string tempstring = "\0", temp = "\0";
                    tempstring += this -> instruction_text[i + 2];
                    temp = this -> binary(tempstring);

                    int diff = 3 - temp.size();
                    for (int i = 0; i < diff; i++) this -> machine_code += "0";
                    this -> machine_code += temp;

                }

            }

            if (instruction_name == "add") this -> machine_code += "00000";

            else if (instruction_name == "sub") this -> machine_code += "00001";

            else if (instruction_name == "and") this -> machine_code += "00010";

            else this -> machine_code += "00011";

        }

        std :: string binary (std :: string& number) {

            std :: string answer = "\0";
            std :: stack<std :: string> tempstack;

            int inumber = stoi(number);

            while (inumber != 0) {

                tempstack.push(std :: to_string(inumber % 2));
                inumber /= 2;

            }

            while (tempstack.size() != 0) {

                answer += tempstack.top();
                tempstack.pop();

            }

            return answer;

        }

        void I_format (std :: string& instruction_name) {

            if (instruction_name == "lw") this -> machine_code += "01";         // opcode

            else if (instruction_name == "sw") this -> machine_code += "10";    // opcode

            else this -> machine_code += "11";                                  // opcode

            if (instruction_name == "lw" || instruction_name == "sw") {         // lw, sw

                std :: string rs = "\0", rt = "\0", number = "\0";

                for (int counter = 0, i = 0; this -> instruction_text[i] != '\0'; i++) {

                    if (counter == 0 && this -> instruction_text[i] == '$') {   // rt

                        std :: string tempstring = "\0", temp = "\0";
                        tempstring += this -> instruction_text[i + 2];
                        temp = this -> binary(tempstring);

                        int diff = 3 - temp.size();
                        for (int j = 0; j < diff; j++) rt += "0";

                        rt += temp;

                        counter += 1;

                    }

                    else if (counter == 1 && this -> instruction_text[i] == '$') {   // rs

                        std :: string tempstring = "\0", temp = "\0";
                        tempstring += this -> instruction_text[i + 2];
                        temp = this -> binary(tempstring);

                        int diff = 3 - temp.size();
                        for (int j = 0; j < diff; j++) rs += "0";

                        rs += temp;

                    }

                    if (this -> instruction_text[i] == ',') {       // immediate8

                        int length = 0;

                        if (this -> instruction_text[i + 2] == '-') {   // negative

                            for (int j = i + 3; this -> instruction_text[j] != '('; j++) length += 1;

                            std :: string tempstring = this -> instruction_text.substr(i + 3, length);
                            std :: string temp = this -> binary(tempstring);
                            // std :: string number = "\0";

                            int diff = 8 - temp.size();
                            for (int j = 0; j < diff; j++) number += "0";
                            number += temp;

                            this -> complement(number);

                            // this -> machine_code += number;

                        }

                        else {          // positive

                            for (int j = i + 2; this -> instruction_text[j] != '('; j++) length += 1;

                            std :: string tempstring = this -> instruction_text.substr(i + 2, length);
                            std :: string temp = this -> binary(tempstring);
                            // std :: string number = "\0";

                            int diff = 8 - temp.size();
                            for (int j = 0; j < diff; j++) number += "0";
                            number += temp;

                            // this -> machine_code += number;

                        }

                    }

                }

                this -> machine_code += rs;
                this -> machine_code += rt;
                this -> machine_code += number;

            }

            else {      // beq

                for (int i = 0; i < this -> instruction_text.size(); i++) {

                    if (this -> instruction_text[i] == '$') {

                        std :: string tempstring = "\0", temp = "\0";
                        tempstring += this -> instruction_text[i + 2];
                        temp = this -> binary(tempstring);

                        int diff = 3 - temp.size();
                        for (int j = 0; j < diff; j++) this -> machine_code += "0";
                        this -> machine_code += temp;

                    }

                    if (this -> instruction_text[i] == ',' && this -> instruction_text[i + 2] != '$') {

                        int length = 0;

                        if (this -> instruction_text[i + 2] == '-') {       // negative

                            for (int j = i + 3; this -> instruction_text[j] != '\0'; j++) length += 1;

                            std :: string tempstring = this -> instruction_text.substr(i + 3, length);
                            std :: string temp = this -> binary(tempstring);
                            std :: string number = "\0";

                            int diff = 8 - temp.size();
                            for (int j = 0; j < diff; j++) number += "0";
                            number += temp;

                            this -> complement(number);

                            this -> machine_code += number;

                        }

                        else {      // positive

                            for (int j = i + 2; this -> instruction_text[j] != '\0'; j++) length += 1;

                            std :: string tempstring = this -> instruction_text.substr(i + 2, length);
                            std :: string temp = this -> binary(tempstring);
                            std :: string number = "\0";

                            int diff = 8 - temp.size();
                            for (int j = 0; j < diff; j++) number += "0";
                            number += temp;

                            this -> machine_code += number;

                        }

                    }

                }

            }

        }

        void complement (std :: string& number) {

            bool passed_one = false;
            for (int i = number.size() - 1; i > -1; i--) {

                if (passed_one) {

                    if (number[i] == '1') number[i] = '0';
                    else number[i] = '1';

                }

                else {

                    if (number[i] == '1') passed_one = true;

                }

            }

            return;

        }

};



int main () {

    Assembler mahdi9000;
    std :: string instruction = "\0";

    std :: cout << "Hello! ";

    while (true) {

        std :: cout << "Enter an istruction (x for exit):\n    ";

        std :: getline(std :: cin, instruction);

        if (instruction == "x") break;

        mahdi9000.set_instruction_text(instruction);
        std :: cout << "\nThe machine code is: " << mahdi9000.generate_machine_code() << "\n\n\n\n";

    }

    system("cls");
    std :: cout << "Good-Bye";

    return 0;

}
