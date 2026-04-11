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
* Validate application functionality using BDD approach
* Ensure end-to-end booking lifecycle correctness
* Verify data consistency across operations
* Test boundary conditions and edge cases
* Validate role-based access control (User vs Admin)

**🧪 Test Coverage**

🔐 Authentication
* User login validation
* Admin login validation
* Invalid credential handling
* Session/token-based authorization checks

🛏️ Room Module
* Room search and discovery
* Room details validation
* Availability checks with different date combinations

📖 Booking Module
* Booking creation with valid and invalid inputs
* Booking retrieval using booking ID
* Booking modification with validation rules
* Booking cancellation and idempotency checks

🔄 End-to-End Flow

Room Availability → Create Booking→ Retrieve Booking → Modify Booking → Cancel Booking
