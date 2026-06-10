<div align="center">

# 💈 Sistema de Agendamento Mobile para Barbearia

**Aplicativo móvel completo para gestão e agendamento de barbearias**

[![Flutter](https://img.shields.io/badge/Flutter-3.10%2B-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![Firebase](https://img.shields.io/badge/Firebase-FFCA28?style=for-the-badge&logo=firebase&logoColor=black)](https://firebase.google.com)
[![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Em%20Desenvolvimento-yellow?style=for-the-badge)]()

</div>

---

## 📋 Índice

- [Sobre o Projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Stack Tecnológica](#-stack-tecnológica)
- [Pré-requisitos](#-pré-requisitos)
- [Licença](#-licença)

---

## 🎯 Sobre o Projeto

O **Sistema de Agendamento Mobile para Barbearia** é uma solução móvel de ponta a ponta desenvolvida em **Flutter**, projetada para conectar clientes aos serviços de uma barbearia de forma fluida e moderna.

O aplicativo oferece uma experiência completa, permitindo que os usuários realizem cadastro, login, visualizem serviços disponíveis, efetuem agendamentos e recebam notificações e lembretes sobre seus horários, tudo por meio de uma interface intuitiva e moderna.

### O que torna este projeto especial?

- **Responsividade inteligente:** Um `ResponsiveWrapper` garante que o layout seja exibido com proporções perfeitas (máximo de 450px de largura), funcionando sem distorções mesmo em ambientes web e desktop.
- **Backend escalável:** Integração nativa com o Firebase (Auth + Firestore), permitindo sincronização em tempo real e autenticação robusta sem necessidade de servidor próprio.
- **Design System consistente:** Toda a paleta de cores, tipografia e estilos são centralizados em `AppTheme.darkTheme`, garantindo consistência visual em todas as telas.

---

## ✨ Funcionalidades

| Módulo | Descrição | Status |
|--------|-----------|--------|
| 🔐 **Autenticação** | Login e cadastro de usuários via Firebase Auth | ✅ Implementado |
| 📅 **Agendamentos** | Marcação e gestão de cortes e serviços | 🟡 Em andamento |
| 🔔 **Notificações de Agendamento** | Lembretes automáticos por e-mail e notificações no aplicativo antes do horário agendado | 🟡 Em andamento |
| 🌙 **Dark Mode** | Tema escuro padronizado em todo o app | ✅ Implementado |

---

## 🛠️ Stack Tecnológica

### Core

| Tecnologia | Versão | Finalidade |
|------------|--------|------------|
| [Flutter](https://flutter.dev) | `>=3.10.0 <4.0.0` | Framework principal (UI cross-platform) |
| [Dart](https://dart.dev) | SDK compatível | Linguagem de programação |

### Firebase (Backend-as-a-Service)

| Pacote | Versão | Finalidade |
|--------|--------|------------|
| `firebase_core` | `^4.7.0` | Inicialização e configuração do ecossistema Firebase |
| `firebase_auth` | `^6.4.0` | Autenticação de usuários (e-mail/senha, OAuth) |
| `cloud_firestore` | `^6.3.0` | Banco de dados NoSQL em tempo real |

### UI & Utilitários

| Pacote | Versão | Finalidade |
|--------|--------|------------|
| `flutter_native_splash` | `^2.4.7` | Splash screen nativa para Android e iOS |
| `intl` | `^0.20.2` | Internacionalização e formatação de datas/moedas |

### Dev Dependencies

| Pacote | Finalidade |
|--------|------------|
| `flutter_lints` | Análise estática e boas práticas de código |
| `flutter_test` | Framework de testes unitários e de widgets |

---

## 📦 Pré-requisitos

Antes de começar, certifique-se de ter as seguintes ferramentas instaladas e configuradas:

- **Flutter SDK** `>=3.10.0` — [Guia de instalação oficial](https://docs.flutter.dev/get-started/install)
- **Dart SDK** — Incluído com o Flutter
- **Git** — Para clonar o repositório
- **Android Studio** ou **VS Code** com as extensões Flutter/Dart
- **Conta no Firebase** — [console.firebase.google.com](https://console.firebase.google.com)
- **FlutterFire CLI** — Para configuração do Firebase

---

## 📄 Licença

Este projeto está licenciado sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.

---

</div>

---
