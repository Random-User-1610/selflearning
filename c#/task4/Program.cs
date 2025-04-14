using System;
using System.Collections;
using System.Linq;

class Program{
    static void Main(){
        List<Student> students = new List<Student>{
            new Student { Name = "A", Age = 15, Grade = 90 },
            new Student { Name = "B", Age = 16, Grade = 95 },
            new Student { Name = "C", Age = 17, Grade = 85 },
            new Student { Name = "D", Age = 15, Grade = 78 },
            new Student { Name = "E", Age = 16, Grade = 92 },
            new Student { Name = "F", Age = 18, Grade = 88 },
            new Student { Name = "G", Age = 17, Grade = 91 },
            new Student { Name = "H", Age = 16, Grade = 74 },
            new Student { Name = "I", Age = 15, Grade = 96 },
            new Student { Name = "J", Age = 18, Grade = 69 },
            new Student { Name = "K", Age = 17, Grade = 83 }
        };

        List<Student>filteredList = students.Where(s => s.Grade > 80).OrderBy(s => s.Name).ThenBy(s => s.Age).ToList();
                                    
        Console.WriteLine("Student List");
        foreach(Student s in students){
            Console.WriteLine($"Name : {s.Name} Age : {s.Age} Grade : {s.Grade}");
        }
        Console.WriteLine();
        Console.WriteLine("Filtered Student List");
        foreach(Student s in filteredList){
            Console.WriteLine($"Name : {s.Name} Age : {s.Age} Grade : {s.Grade}");
        }
    }
}

public class Student{
    public string Name{ get; set; }
    public int Age{ get; set; }
    public int Grade{ get; set; }
}