# 💈 Sistema de Agendamento Mobile prara Barbearias

Aplicativo mobile de agendamento para barbearias, desenvolvido em **Flutter** com **Firebase** (Authentication + Cloud Firestore). O app permite que clientes criem conta, agendem cortes/serviços com barbeiro e horário de preferência, acompanhem seu histórico, cancelem agendamentos, acumulem pontos de fidelidade, consultem produtos e recebam notificações locais de lembrete.

---

## 📑 Sumário

- [Sobre o projeto](#-sobre-o-projeto)
- [Funcionalidades](#-funcionalidades)
- [Stack e principais dependências](#-stack-e-principais-dependências)
- [Estrutura do projeto](#-estrutura-do-projeto)
- [Pré-requisitos](#-pré-requisitos)
- [Configuração do Firebase](#-configuração-do-firebase)
- [Instalação e execução](#-instalação-e-execução)
- [Testes](#-testes)
- [Contribuindo](#-contribuindo)
- [Licença](#-licença)

---

## 📖 Sobre o projeto

O **Sistema de Agendamento Mobile prara Barbearias** é um aplicativo de agendamento (booking) pensado para pequenas e médias barbearias.

O fluxo principal do usuário é:

1. Criar conta / fazer login (Firebase Authentication);
2. Escolher serviço, barbeiro e horário disponível;
3. Confirmar o agendamento (persistido no Cloud Firestore);
4. Receber uma notificação local como lembrete;
5. Acompanhar, no histórico, os agendamentos ativos e passados, podendo cancelá-los;
6. Acumular pontos no programa de fidelidade e conferir produtos disponíveis na barbearia.

## ✨ Funcionalidades

- 🔐 **Autenticação** — cadastro e login de clientes via Firebase Auth
- 📅 **Agendamento (Booking)** — fluxo em etapas para escolher serviço, barbeiro, dia e horário, com verificação de horários disponíveis
- 🕓 **Histórico de agendamentos** — listagem dos agendamentos do usuário com opção de cancelamento
- 🔔 **Notificações locais** — lembretes agendados com `flutter_local_notifications` + `timezone`
- 🎁 **Programa de fidelidade (Loyalty)** — acompanhamento de pontos/benefícios do cliente
- 🛍️ **Catálogo de produtos** — vitrine de produtos vendidos pela barbearia
- 👤 **Perfil do usuário** — gerenciamento de dados da conta
- 🎨 **Tema dark customizado** — identidade visual própria (`AppTheme` / `AppColors`)
- 📱 **Layout responsivo** — mesma experiência em mobile, desktop e web

## 🧱 Stack e principais dependências

| Categoria         | Tecnologia |
|--------------------|-----------|
| Framework          | [Flutter](https://flutter.dev) (Dart) |
| Backend / BaaS      | [Firebase](https://firebase.google.com) — Authentication, Cloud Firestore |
| Notificações        | `flutter_local_notifications`, `timezone` |
| Requisições HTTP    | `http` |
| Internacionalização | `intl` |
| Links externos      | `url_launcher` |
| Splash screen       | `flutter_native_splash` |
| Testes unit./widget | `flutter_test`, `mocktail` |
| Testes de integração| `integration_test` |
| Testes de aceitação | [Playwright](https://playwright.dev/python/) (Python) |
| Lint                | `flutter_lints` |

## 📂 Estrutura do projeto

```
Barbearia_Barbu/
├── android/                 # Projeto nativo Android
├── ios/                     # Projeto nativo iOS
├── linux/                   # Projeto nativo Linux
├── macos/                   # Projeto nativo macOS
├── web/                     # Projeto Web (index.html, ícones, manifest)
├── windows/                 # Projeto nativo Windows
├── lib/
│   ├── main.dart            # Entry point, inicialização do Firebase e rotas
│   ├── firebase_options.dart# Configuração gerada pelo FlutterFire CLI
│   ├── core/
│   │   └── theme/           # Tema (cores, tipografia) do app
│   ├── models/
│   │   └── service_model.dart # Dados de serviços, barbeiros e horários
│   ├── services/
│   │   └── notification_service.dart # Serviço de notificações locais
│   └── screens/
│       ├── splash/          # Tela de abertura
│       ├── auth/            # Login e cadastro
│       ├── home/            # Home, fidelidade e produtos
│       ├── bookings/        # Fluxo de agendamento
│       ├── history/         # Histórico de agendamentos
│       ├── notifications/   # Central de notificações
│       └── profile/         # Perfil do usuário
├── test/                    # Testes unitários e de widget
├── integration_test/        # Testes de integração (end-to-end no device)
├── tests_aceitacao/         # Testes de aceitação com Playwright (Python)
├── firebase.json            # Configuração dos apps Firebase por plataforma
├── analysis_options.yaml    # Regras de lint
└── pubspec.yaml             # Dependências e metadados do projeto
```

## ✅ Pré-requisitos

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (canal `stable`, Dart `>=3.10.0 <4.0.0`)
- Um editor com suporte a Flutter (Android Studio, VS Code, etc.)
- Uma conta e projeto no [Firebase Console](https://console.firebase.google.com/)
- [FlutterFire CLI](https://firebase.google.com/docs/flutter/setup) para gerar/regerar as configurações do Firebase
- Para rodar os testes de aceitação: **Python 3** e [Playwright](https://playwright.dev/python/)

Verifique se o ambiente Flutter está corretamente configurado com:

```bash
flutter doctor
```

## 🔥 Configuração do Firebase

Este projeto utiliza **Firebase Authentication** e **Cloud Firestore**. O arquivo `lib/firebase_options.dart` já contém a configuração do projeto original (`barbu-barbearia`) usada em desenvolvimento — para rodar com seu **próprio** projeto Firebase, siga os passos abaixo:

1. Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
2. Ative os provedores de **Authentication** (E-mail/Senha) e o banco **Cloud Firestore**.
3. Instale a CLI do Firebase e o FlutterFire CLI:

   ```bash
   npm install -g firebase-tools
   dart pub global activate flutterfire_cli
   ```

4. Faça login e conecte o app ao seu projeto Firebase:

   ```bash
   firebase login
   flutterfire configure
   ```

   Isso irá regenerar `lib/firebase_options.dart` e os arquivos nativos (`google-services.json`, `GoogleService-Info.plist`, etc.) para o seu projeto.

5. Configure as regras de segurança do Firestore de acordo com a modelagem de dados de agendamentos (`collection('bookings')`) e usuários utilizada pelo app.

## 🚀 Instalação e execução

```bash
# 1. Clone o repositório
git clone https://github.com/ChMoreiraa/Barbearia_Barbu.git
cd Barbearia_Barbu

# 2. Instale as dependências
flutter pub get

# 3. (Opcional) Configure seu próprio projeto Firebase — veja a seção acima

# 4. Liste os dispositivos/emuladores disponíveis
flutter devices

# 5. Execute o app no dispositivo/emulador ou navegador desejado
flutter run
```

Para rodar em uma plataforma específica:

```bash
flutter run -d chrome    # Web
flutter run -d windows   # Windows
flutter run -d macos     # macOS
flutter run -d linux     # Linux
```

## 🧪 Testes

O projeto conta com três camadas de testes:

**Testes unitários e de widget** (Dart / `flutter_test` + `mocktail`):

```bash
flutter test
```

**Testes de integração** (rodam em um dispositivo/emulador real):

```bash
flutter test integration_test
```

**Testes de aceitação** (Python + Playwright, simulam o uso real do app rodando na Web):

```bash
# Em um terminal, sirva o app Web (ajuste a porta se necessário)
flutter run -d web-server --web-port 58071

# Em outro terminal, instale as dependências do Playwright
pip install playwright
playwright install

# Execute o roteiro de aceitação
python tests_aceitacao/test_barbu.py
```

## 🤝 Contribuindo

Contribuições são bem-vindas!

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/minha-feature`)
3. Faça commit das suas alterações (`git commit -m 'feat: adiciona minha feature'`)
4. Faça push para a branch (`git push origin feature/minha-feature`)
5. Abra um Pull Request

Antes de submeter, verifique se o código passa no linter e nos testes:

```bash
flutter analyze
flutter test
```

## 📄 Licença

Este projeto ainda não possui um arquivo de licença definido. Caso pretenda reutilizar o código, entre em contato com o autor ([ChMoreiraa](https://github.com/ChMoreiraa)) para esclarecer os termos de uso.

---

Desenvolvido com 💈 e Flutter.
