// See https://aka.ms/new-console-template for more information

using System;

class Calculator
{
    // Function to perform calculations
    static double Calculate(double num1, double num2, char op)
    {
        switch (op)
        {
            case '+': return num1 + num2;
            case '-': return num1 - num2;
            case '*': return num1 * num2;
            case '/':
                if (num2 != 0)
                    return num1 / num2;
                else
                {
                    Console.WriteLine("Error: Division by zero!");
                    return 0;
                }
            default:
                Console.WriteLine("Error: Invalid operator!");
                return 0;
        }
    }

    static void Main()
    {
        double num1, num2;
        char op;
        char choice;
        
        do
        {
            // Get user input
            Console.Write("Enter first number: ");
            num1 = Convert.ToDouble(Console.ReadLine());
            Console.Write("Enter operator (+, -, *, /): ");
            op = Convert.ToChar(Console.ReadLine());
            Console.Write("Enter second number: ");
            num2 = Convert.ToDouble(Console.ReadLine());
            
            // Perform calculation and display result
            double result = Calculate(num1, num2, op);
            Console.WriteLine("Result: " + result);
            
            // Ask user if they want to continue
            Console.Write("Do you want to perform another calculation? (y/n): ");
            choice = Convert.ToChar(Console.ReadLine());
        } while (choice == 'y' || choice == 'Y');
        
        Console.WriteLine("Calculator exiting...");
    }
}
