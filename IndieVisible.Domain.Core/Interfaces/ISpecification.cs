﻿using System;
using System.Collections.Generic;
using System.Text;

namespace IndieVisible.Domain.Core.Interfaces
{
    public interface ISpecification<in T>
    {
        bool IsSatisfiedBy(T item);

        string ErrorMessage { get; }
    }
}