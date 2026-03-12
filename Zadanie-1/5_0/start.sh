#!/bin/bash 
set -e

printMainMenu() {
    echo "========================"
    echo "===== BUBBBLE SORT ====="
    echo "========================"
    echo "1. Wylosuj nowe dane"
    echo "2. Posortuj dane"
    echo "3. Wykonaj test programu"
    echo "4. Wyjscie"

    makeMainChoice
}

makeMainChoice() {
    echo ""
    echo -n "Wybor: "
    read choice

    case $choice in
        1)
            generateNumbersMenu
            ;;
        2)
            printSort
            ;;
        3)
            doUnitTest
            ;;
        4)
            exit 0
            ;;
        *)
            echo "Niepoprawny wybor"
            makeMainChoice
            ;;
    esac
}

generateNumbersMenu() {
    echo "========================"
    echo "1. Losowanie podstawowe"
    echo "2. Losowanie zaawansowane"
    echo "3. Powrot"

    makeGenChoice
}

makeGenChoice() {
    echo ""
    echo -n "Wybor: "
    read choice

    case $choice in
        1)
            simpleGen
            ;;
        2)
            betterGen
            ;;
        3)
            clear
            printMainMenu
            ;;
        *)
            echo "Niepoprawny wybor"
            makeGenChoice
            ;;
    esac
}

simpleGen() {
    ../3_0/simpleGenerator.x > ./numbers.in
    clear
    echo "Twoje nowe dane:"
    cat ./numbers.in
    echo ""
    printMainMenu
}

betterGen() {
    echo ""
    echo "Podaj zakres generowanych liczb"
    echo -n "Min: "
    read min
    echo -n "Max: "
    read max
    echo -n "Podaj ile liczb wygenerowac (max 100): "
    read ile

    if [[ ! "$min" =~ ^-?[0-9]+$ || ! "$max" =~ ^-?[0-9]+$ || ! "$ile" =~ ^-?[0-9]+$ || $ile -lt 0 || $ile -gt 100 ]] ; then
        clear
        echo "Niepoprawne dane"
        echo ""
        printMainMenu
    fi

    ../4_0/betterGenerator.x $min $max $ile > ./numbers.in
    clear
    echo "Twoje nowe dane:"
    cat ./numbers.in
    echo ""
    printMainMenu
}

printSort() {
    if [[ ! -f "./numbers.in" ]] ; then
        clear
        echo "Brak danych do posortowania"
        echo ""
        printMainMenu
    fi

    ../3_5/bubbleSort.x < ./numbers.in > numbers.out

    clear
    echo "Twoje dane:"
    cat ./numbers.in
    echo ""
    echo "Posortowane dane:"
    cat ./numbers.out
    echo ""
    printMainMenu
}

doUnitTest() {
    clear
    ../4_5/unitTesting.x
    echo ""
    printMainMenu
}

# START
clear
printMainMenu
