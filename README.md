**🏠 Hotel Room Booking Application – BDD Test Suite**

📌 Overview
This repository contains a comprehensive Behavior-Driven Development (BDD) test suite for a Hotel Room Booking Application.
The suite validates complete booking workflows including:

* User authentication
* Room search & discovery
* Availability checks
* Booking creation
* Booking retrieval
* Booking modification
* Booking cancellation
* End-to-End lifecycle

The tests are designed using Gherkin syntax and aligned with real-world application behavior, covering positive, negative, edge, and security scenarios.

**🎯 Objectives**
* Validate core application functionality using a Behavior-Driven Development (BDD) approach
* Ensure accuracy and reliability of the complete end-to-end booking lifecycle
* Maintain data integrity and consistency across all booking operations
* Identify and validate boundary conditions, edge cases, and negative scenarios
* Enforce and verify role-based access control between User and Admin roles

**🧪 Test Coverage**

🔐 Authentication
* Validate user and admin login
* Handle invalid credentials
* Verify session and token-based authorization

🛏️ Room Module
* Search and discover rooms
* Validate room details
* Check availability across date combinations

📖 Booking Module
* Create bookings with valid and invalid inputs
* Retrieve bookings by ID
* Modify bookings with validation rules
* Cancel bookings with idempotency checks

🔄 End-to-End Flow

Room Availability → Create Booking→ Retrieve Booking → Modify Booking → Cancel Booking
