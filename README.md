# 🎯 ReelMind AI — Semantic Tech Reel Recommender

> **An AI-powered recommendation agent** that analyzes student Reel interactions, infers their underlying interests, and recommends engaging technology content — going far beyond simple keyword matching.

---

## 📖 Problem Statement

Students spend significant time scrolling short-form content. Much of it may be harmless entertainment but provides little educational or career value.

**ReelMind AI** analyzes the Reels a student interacts with, infers their *underlying interests*, and recommends engaging technology-related Reels that match those interests. The agent understands **topic, context, and apparent intent** — not just keywords.

---

## 🧠 The Core Challenge: Avoiding Keyword Traps

A shallow system sees:
```
Student watches Java meme → recommends another Java meme
```

**ReelMind AI** sees:
```
Java meme + SWE Lifestyle + Coding Interview Joke + Laptop Benchmark + Docker Crash
    ↓
Underlying interest = Software Engineering / Scalable Systems
    ↓
Recommends: "How Modern Software Systems Handle 10M Requests/sec — Beginner HLD"
```

---

## ✨ Features

| Feature | Description |
|---|---|
| 🧠 **Semantic Content Understanding** | Analyzes transcripts, captions, visual context for underlying domain & intent |
| 📊 **Normalized Scoring Formula** | `0.45×Watch + 0.15×Replay + 0.15×Like + 0.15×Save + 0.10×Share` |
| 🛡️ **Anti-Hype Filter** | Penalizes clickbait (Hype Score 0–1), rejects sensationalized content |
| 🔍 **Cosine Vector Search** | Semantic TF-IDF embeddings + cosine similarity for candidate retrieval |
| 🎯 **Novelty Scoring** | Prevents echo chambers — avoids recommending what was already watched |
| 📈 **Confidence Calibration** | `High / Medium / Low` with explicit justification based on data quantity |
| 🔄 **Feedback Loop** | 👍/👎 feedback updates the student interest profile dynamically |
| 📋 **Recommendation Diversity** | Top-3 diverse picks across different domains |
| 🧪 **Evaluation Benchmark** | 4 test cases across student profiles with pass/fail verdicts |
| 💾 **SQLite Persistence** | All interactions and recommendations logged persistently |

---

## 🗂️ Project Structure

```
tech-reel-recommender/
├── README.md                             # This file
├── requirements.txt                      # Python dependencies
├── .gitignore                            # Git ignore rules
├── run_all.bat                           # Windows 1-click launcher
│
├── backend/
│   ├── run_backend.py                    # FastAPI server launcher
│   ├── test_pipeline.py                  # Automated 8-reel benchmark tests
│   ├── verify_server.py                  # HTTP integration test suite
│   └── app/
│       ├── main.py                       # FastAPI routes & endpoints
│       │
│       ├── models/
│       │   └── schemas.py                # Pydantic data models
│       │
│       ├── data/
│       │   ├── reels_database.json       # 20 curated tech + entertainment reels
│       │   └── personas.json             # 4 student persona benchmarks
│       │
│       ├── db/
│       │   └── database.py               # SQLite persistent storage manager
│       │
│       └── services/
│           ├── content_understanding.py  # Multimodal intent & topic extractor
│           ├── profile_engine.py         # Normalized interest scoring & confidence
│           ├── embedding_engine.py       # Dense vector embeddings & cosine retrieval
│           ├── anti_hype_filter.py       # Anti-hype scoring formula & filter
│           ├── ai_reasoning.py           # Semantic signal synthesizer
│           ├── explainability_engine.py  # Structured output formatter
│           └── recommender_engine.py     # Full pipeline orchestrator
│
└── frontend/
    ├── index.html                        # React 18 SPA shell (served by FastAPI)
    ├── css/
    │   └── styles.css                    # Glassmorphism dark theme
    └── js/
        └── app.js                        # Full React dashboard
```

---

## 🚀 Quick Start

### Prerequisites
- Python 3.9+
- No Node.js required (React runs via CDN)

### 1. Clone the repository
```bash
git clone https://github.com/YOUR_USERNAME/tech-reel-recommender.git
cd tech-reel-recommender
```

### 2. Install dependencies
```bash
pip install -r requirements.txt
```

### 3. Start the server
```bash
python backend/run_backend.py
```

**Or on Windows**, double-click `run_all.bat`

### 4. Open the dashboard
Open **[http://localhost:8000](http://localhost:8000)** in your browser.

---

## 🎓 Sample Input Dataset (8 Primary Reels)

| ID | Reel | Type |
|---|---|---|
| R01 | Java Developer Meme: NullPointerException | Programming Meme |
| R02 | Day in the Life of a Software Engineer | Career |
| R03 | Coding Interview Joke: Inverting Binary Trees | DSA / Career |
| R04 | M4 Max Laptop Benchmark: 500k Line Rust Build | Gadgets / Hardware |
| R05 | Gaming Rage Meme: Disconnect at Final Boss | Gaming / Entertainment |
| R06 | "10 AI Tools to Make $200k in 30 Days!" | AI Hype / Clickbait |
| R07 | How RAG Systems Actually Work: Vector DBs | AI / ML |
| R08 | Why Docker Containers Crash: Linux cgroups & OOM | Cloud / DevOps |

---

## 📐 Scoring Formulas

### Apparent Interest Score
```
Score = 0.45 × Watch% + 0.15 × Replay + 0.15 × Like + 0.15 × Save + 0.10 × Share
```

### Recommendation Score
```
Score = 0.35 × Interest Match
      + 0.25 × Educational Value
      + 0.15 × Engagement Potential
      + 0.15 × Novelty
      + 0.10 × Career Relevance
      − Hype Penalty
      − Credibility Penalty
```
> All values are normalized between **0.0 and 1.0**

---

## 🌐 API Endpoints

| Method | Endpoint | Description |
|---|---|---|
| `GET` | `/` | Web Dashboard |
| `GET` | `/api/reels` | List all indexed reels |
| `GET` | `/api/personas` | Load pre-configured student profiles |
| `POST` | `/api/recommend` | Generate AI recommendation |
| `POST` | `/api/feedback` | Submit useful/not-useful feedback |
| `GET` | `/api/evaluate` | Run evaluation benchmark |
| `POST` | `/api/custom-reel` | Add a custom reel to the catalog |
| `GET` | `/api/db/stats` | SQLite database statistics |
| `GET` | `/docs` | Swagger interactive API documentation |

---

## 🧪 Evaluation Results

| Test | Keyword Trap Avoided | Hype Rejected | Correct Category | Status |
|---|:---:|:---:|:---:|:---:|
| Java Meme Trap → HLD | ✅ | ✅ | ✅ | **PASS** |
| AI Hype Filter → RAG | ✅ | ✅ | ✅ | **PASS** |
| Cloud DevOps → Distributed Systems | ✅ | ✅ | ✅ | **PASS** |
| Cybersecurity → AppSec | ✅ | ✅ | ✅ | **PASS** |

---

## 🏗️ Architecture

```
Reel History (8 interactions)
        ↓
Content Analyzer (transcript + visual context + intent)
        ↓
Interest Engine (normalized signals + domain aggregation)
        ↓
Interest Profile (SWE 91%, Programming 87%, Hardware 68%)
        ↓
Candidate Search (cosine vector similarity over 20+ reels)
        ↓
Quality Filter (Anti-Hype score + Credibility check)
        ↓
Ranking Engine (Relevance + Novelty + Education + Career)
        ↓
Explanation Synthesizer (structured output schema)
        ↓
Final Result + Confidence + Rejection Audit
```

---

## 📄 License

MIT License — free to use, modify, and distribute.

---

## 👨‍💻 Built For

Hackathon / Academic Project demonstrating AI-powered semantic recommendation with explainability.
"# ReelMind" 
