---
title: "Language Understanding using Azure"
excerpt: "Reinventing the customer experience. Explore the possibility of developing a polyglot chatbot"
header:
  image: /assets/img_portfolio/oc1/translation.PNG
  teaser: /assets/img_portfolio/oc1/translation_cloud.PNG
sidebar:
  - title: "Role"
    image: /assets/icons/path_oc.png
    image_alt: "logo"
    text: "IA Student, Lyon, France"
  - title: "Responsibilities"
    text:
    - Creation of a Translation Text ressources
    - Test using API CURL
toc: true
toc_label: BARTCUS Marius
toc_sticky: true
---

# Introduction

## My Experience as an AI Student: Developing a Chatbot for Credit Banque
To discuss my experiences and feelings as an AI student, I began publishing OpenClassroom course projects. Also, this gives me the possibility to share the skills that we gain by doing the projects of the course. Previously, I was a research engineer in the field of artificial intelligence. It was my responsibility to develop and optimize machine learning algorithms for huge datasets. Having completed this course, I have gained a deeper understanding of the skills that companies are seeking in AI engineers. This is the result of completing this course.

I am considered to be an entry-level AI engineer at Credit Banque for this project. There is a need for the bank to develop a chatbot that can respond to clients around the globe.

When I first read the announcement of the project, it did not seem so simple to me. But once I started working on it, I made rapid progress. As a result, I finished it really fast, allowing me to focus on the next project more.


## About the project
Let me now, start by describing the first project. I will not go a lot into details. I'll just tell you that, for this small project we had to explore the the AI engineer's specialty:

1. by taking an interview from our mentor,
2. by exploring the possibility of developing a polyglot chatbot.

Here, I will discuss the second part of the project, in which I explored the possibility of developing a polyglot chatbot. Additionally, I gained a better understanding of cloud computing, specifically Azure Cloud. My learning experience included an overview of cognitive services and how to create and use them using Python and the CURL API. 

As a first step, I needed to understand what cloud computing is and how it can be used for this project.

## Cloud computing

Cloud computing is a new technology that has revolutionized how businesses and individuals access, store, and share data. In essence, cloud computing enables users to access their data from any device or location with an internet connection. By utilizing remote servers hosted in the cloud instead of local hardware resources on-site, organizations can save on infrastructure costs while providing secure storage for sensitive information. 

Cloud computing is the on-demand availability of computer system resources. Speaking about cloud computing, we mean:

- computer,
- system ressource,
- cloud storage or data storage,
- computing power,
where the user does not have direct active management.

We also can denote 3 types of architectures:

- pay as you go: you pay what you use. You pay as your service is running
- event-driven: your cloud services are executed in response to events (HTTP request, a timer, a record added to a database, a file being uploaded)
- stateless: your cloud services are cold until responding to an event and go cold after a short event

## Azure cloud

Azure is a public cloud computing platform that offers a scalable, reliable, and secure environment for building, deploying, and managing applications and services. Using the azure portal developers can access a range of services, such as virtual machines, databases, storage, analytics, and artificial intelligence (AI) services, that can be used to build applications for various platforms, including Windows, Linux, and mobile devices. Azure also supports a variety of programming languages (including Python, .NET Core, NodeJS, etc), frameworks, and tools, making it a flexible platform for developers. Overall, Azure Cloud provides businesses with the tools and infrastructure they need to build, deploy, and manage their applications and services in a secure, scalable, and cost-effective manner.

## Dataset

In this project, I will examine the language detection capabilities of the Azure cloud. I will be using the Wikipedia Language Identification Database. The dataset contains 200.000 paragraphs in 235 languages. Each paragraph in the data is assigned to a particular language. As a demonstration of the capability to detect speech using Azure, we selected the five most spoken languages in the world and demonstrated how these languages are recognized.

# Microsoft Azure - Service Cognitive (Translator)

Cognitive Services that enable developers to add intelligent capabilities to their applications without requiring deep knowledge in AI. These services are pre-built and ready-to-use APIs that can perform various tasks such as speech recognition, image and video analysis, natural language processing, and machine learning.

Here are some of the Cognitive Services offered by Azure:

- Computer Vision: An API that can analyze images and videos, identify objects and faces, recognize text in images, and more.
- Text Analytics: An API that can extract insights from text data, such as sentiment analysis, key phrase extraction, and language detection.
- Speech Services: APIs that can perform speech-to-text and text-to-speech conversion, and speaker recognition.
- Translator Text: An API that can translate text in real-time across multiple languages.
- Custom Vision: An API that enables developers to build custom image recognition models using their own data.
- Anomaly Detector: An API that can detect anomalies in time-series data, such as temperature readings or website traffic.
- Personalizer: An API that can optimize and personalize content recommendations for individual users.

Azure Cognitive Services provides developers with the tools and infrastructure they need to easily incorporate intelligent capabilities into their applications and services, without requiring extensive AI expertise. 

In order to accomplish our task, we will utilize ***Translator Text***, which is a neuronal translation service based on a part of Azure Cognitive Services.

{% include figure image_path="/assets/img_portfolio/oc1/translation.png" alt="this is a placeholder image" caption="Figure 1: Translation." %}

# Creating the application

To create our application, there are two steps.

1) Create the ressources in the Azure portal for Translator (as in Figure 2)

{% include figure image_path="/assets/img_portfolio/oc1/Translator_ressource.png" alt="this is a placeholder image" caption="Figure 2: Translation." %}

2) Create our python script that uses the API_KEY and the URL (endpoint). Theese will be given as environment variables.

You can find the scripts on my github acoount.

<a href="https://github.com/mbartcus/LanguageTranslator-withAzure" class="btn btn--primary">LanguageTranslator-withAzure Github</a>

# Results

I show two types of results. The first one is if we choose the language and give the text our selfs.
{% include figure image_path="/assets/img_portfolio/oc1/our_text.png" alt="this is a placeholder image" caption="Figure 3: Translation of our text." %}

Another example is by giving the 5 most spoken languages that are according to [most spoken langues](https://1to1progress.fr/blog/2021/04/30/combien-de-langues-dans-le-monde/)  
 Chinois, Anglais, Hindi, Espagnol, Arabe.

{% include figure image_path="/assets/img_portfolio/oc1/5lang.png" alt="this is a placeholder image" caption="Figure 4: Translation of 5 language text." %}