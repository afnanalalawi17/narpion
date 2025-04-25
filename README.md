# Narpion App

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.


# Narbion-AI-Matchmaking-Model
[Narbion Model](https://github.com/marws171/Narbion-AI-Matchmaking-Model)
AI model for Narbion, a matchmaking system that connects athletes with suitable opponents based on skill level, availability, location, and sport Built with a neural network trained on a realistic dataset of 10,000 players Achieved 93.86% accuracy.
# Narbion Matchmaking AI Model

This repository contains the core AI model used in the Narbion app, a smart matchmaking platform that connects athletes with suitable opponents based on multiple features such as sport type, skill level, location, and availability.

---

# 📌 Project Overview
Narbion is an AI-powered system designed to enhance the athlete experience by helping them find well-matched competitors The model considers factors like age, gender, city, neighborhood, availability (days & times), and level of competitiveness.

---

# 🧠 Model Description
- **Architecture:** Feedforward neural network
- **Framework:** TensorFlow / Keras
- **Input Features:**
  - Age
  - Gender
  - Sport
  - City
  - Neighborhood
  - Skill Level
  - Competitive Level
  - Available Days
  - Available Times
  - Hours Available

- **Output:** Similarity score (0 to 1) for matchmaking

---

# 📊 Dataset
- **Total Samples:** 10,000 synthetic but realistic athlete profiles
- **Sources:**
  - Elo rating data from Kaggle
  - Sport types from the Saudi Open Data Portal
  - Player names, cities, and neighborhoods manually enriched

---

# ✅ Performance
- **Accuracy Achieved:** 93.86%
- **Evaluation Metrics:**
  - Accuracy
  - Precision
  - Recall
  - F1 Score
  - Confusion Matrix

---

# 🚀 How to Run
1. Upload the dataset CSV to your Google Drive.
2. Load and preprocess the data using the provided scripts.
3. Train the model using Keras.
4. Predict and sort opponents by similarity score.

---

# 📁 File Structure
- `narbion_model.ipynb` – Core notebook containing data loading, preprocessing, model building, training, and evaluation.
- `players_data_full_realistic.csv` – Main dataset used for training.

---

# 🧪 Testing and Validation
The model was tested using an 80/20 train-test split and validated through classification metrics and matchmaking accuracy. A UI/UX prototype and Flutter mobile app were also developed as part of the full solution.

---

# 🤝 Acknowledgments
- Kaggle ([Elo Score Data](https://www.kaggle.com/datasets/saurabhshahane/major-league-baseball-dataset))
- [Saudi Open Data Platform](https://open.data.gov.sa/ar/datasets/view/9f1313e2-26c2-41cf-a024-17e4d39753b3)
- Ministry of Sports (KSA) [Data](https://open.data.gov.sa/ar/datasets/view/9f1313e2-26c2-41cf-a024-17e4d39753b3/resources)



