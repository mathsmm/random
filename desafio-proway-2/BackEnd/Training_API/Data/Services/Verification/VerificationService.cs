using System;
using System.Collections.Generic;
using System.Linq;

namespace Training_API.Data.Services.Verification
{
    public class VerificationService
    {
        public bool VerifyDifferenceOfOne(List<int> list)
        {
            int maxValue = list.Max<int>();
            int minValue = list.Min<int>();
            if ((maxValue - minValue) > 1)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool VerifyPeopleExcess(int roomCapacity, int peopleQuantity)
        {
            if (peopleQuantity > roomCapacity)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}