﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CSharpProject.DTO

{
    public abstract class People
    {
        public String Id
        {
            get;
            set;
        }

        public string Name
        {
            get;
            set;
        }

        public string Gender
        {
            get;
            set;
        }
        public string Address
        {
            get;
            set;
        }
        public DateTime Birthday
        {
            get;
            set;
        }
        public string Birthplace
        {
            get;
            set;
        }
        public string Email
        {
            get;
            set;
        }
        public string Phone
        {
            get;
            set;
        }
        public string Image
        {
            get;
            set;
        }
        public People(string id, string name, string gender, string address, DateTime birthday, string birthplace, string email, string phone, string image)
        {
            Id = id;
            Name = name;
            Gender = gender;
            Address = address;
            Birthday = birthday;
            Birthplace = birthplace;
            Email = email;
            Phone = phone;
            Image = image;
        }
        public People()
        {

        }
    }
}