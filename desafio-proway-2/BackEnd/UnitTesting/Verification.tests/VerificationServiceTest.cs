using System.Collections.Generic;
using NUnit.Framework;
using Training_API.Data.Services.Verification;

namespace Verification.tests
{
    public class VerificationServiceTest
    {
        private VerificationService _verificationService;
        [SetUp]
        public void SetUp()
        {
            _verificationService = new VerificationService();
        }

        [Test]
        public void VerifyDifferenceOfOne_UsingDifferenceOfThreeNumbers_MustReturnTrue()
        {
            // Arrange
            List<int> listOfValues = new List<int>();
            listOfValues.Add(1);
            listOfValues.Add(4);
            listOfValues.Add(3);
            listOfValues.Add(2);

            // Act
            bool result = _verificationService.VerifyDifferenceOfOne(listOfValues);

            // Assert
            Assert.That(result, Is.EqualTo(true));
        }

        [Test]
        public void VerifyDifferenceOfOne_UsingDifferenceOfFiveNumbers_MustReturnTrue()
        {
            // Arrange
            List<int> listOfValues = new List<int>();
            listOfValues.Add(90);
            listOfValues.Add(95);
            listOfValues.Add(93);
            listOfValues.Add(92);
            listOfValues.Add(92);
            listOfValues.Add(94);
            listOfValues.Add(93);
            listOfValues.Add(90);

            // Act
            bool result = _verificationService.VerifyDifferenceOfOne(listOfValues);

            // Assert
            Assert.That(result, Is.EqualTo(true));
        }

        [Test]
        public void VerifyDifferenceOfOne_UsingDifferenceOfOneNumber_MustReturnFalse()
        {
            // Arrange
            List<int> listOfValues = new List<int>();
            listOfValues.Add(13);
            listOfValues.Add(14);
            listOfValues.Add(13);
            listOfValues.Add(14);
            listOfValues.Add(14);
            listOfValues.Add(13);

            // Act
            bool result = _verificationService.VerifyDifferenceOfOne(listOfValues);

            // Assert
            Assert.That(result, Is.EqualTo(false));
        }

        [Test]
        public void VerifyPeopleExcess_UsingExcessOfFive_MustReturnTrue()
        {
            // Arrange
            int roomCapacityValue = 10;
            int peopleQuantityValue = 15;

            // Act
            bool result = _verificationService.VerifyPeopleExcess(roomCapacityValue, peopleQuantityValue);

            // Assert
            Assert.That(result, Is.EqualTo(true));
        }

        [Test]
        public void VerifyPeopleExcess_UsingThreeSpacesLeft_MustReturnFalse()
        {
            // Arrange
            int roomCapacityValue = 56;
            int peopleQuantityValue = 53;

            // Act
            bool result = _verificationService.VerifyPeopleExcess(roomCapacityValue, peopleQuantityValue);

            // Assert
            Assert.That(result, Is.EqualTo(false));
        }

        [Test]
        public void VerifyPeopleExcess_UsingTwentySpacesLeft_MustReturnFalse()
        {
            // Arrange
            int roomCapacityValue = 55;
            int peopleQuantityValue = 35;

            // Act
            bool result = _verificationService.VerifyPeopleExcess(roomCapacityValue, peopleQuantityValue);

            // Assert
            Assert.That(result, Is.EqualTo(false));
        }
    }
}