import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['pt', 'en', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? ptText = '',
    String? enText = '',
    String? esText = '',
  }) =>
      [ptText, enText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // ChatMain
  {
    '6puu2tcx': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // chatDetails
  {
    'tyeb6jhg': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // changePassword
  {
    'hf9o1pis': {
      'pt': 'Email Address',
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
    },
    'ndytqbjg': {
      'pt': 'Your email..',
      'en': 'Your email..',
      'es': 'Tu correo electrónico..',
    },
    'nq80y3wc': {
      'pt':
          'Iremos lhe enviar um e-mail com um link para redefinir sua senha, digite o e-mail associado à sua conta acima.',
      'en':
          'We will send you an email with a link to reset your password, enter the email associated with your account above.',
      'es':
          'Le enviaremos un correo electrónico con un enlace para restablecer su contraseña, ingrese el correo electrónico asociado con su cuenta arriba.',
    },
    'bcxayguq': {
      'pt': 'Enviar link',
      'en': 'Send link',
      'es': 'Enviar enlace',
    },
    '62dk130b': {
      'pt': 'Alterar Senha',
      'en': 'Change Password',
      'es': 'Cambiar contraseña',
    },
    'pvwrprm8': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Notifications
  {
    'wluw3bo5': {
      'pt': 'Notificações',
      'en': '',
      'es': '',
    },
    'd1w17my1': {
      'pt': 'Hoje',
      'en': '',
      'es': '',
    },
    '1r8szb5x': {
      'pt': 'Antigo',
      'en': '',
      'es': '',
    },
    'z99tq08g': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // Dashboard
  {
    'xpq3eg8o': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // Place
  {
    'bc5wl5ko': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Event
  {
    '5oxbpzq6': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Checkout
  {
    'md80bdoc': {
      'pt': 'Pagamento Confirmado!',
      'en': 'Payment confirmed!',
      'es': '¡Pago confirmado!',
    },
    'bapuho2w': {
      'pt':
          'Seu pagamento foi confirmado. \nNossa equipe esta verificando sua assinatura, em breve seu acesso será liberado e disponibilizado para sua edição.',
      'en':
          'Your payment has been confirmed.\nOur team is verifying your subscription, your access will soon be released and made available for editing.',
      'es':
          'Su pago ha sido confirmado.\nNuestro equipo está verificando su suscripción; su acceso pronto se liberará y estará disponible para su edición.',
    },
    's4h4me8c': {
      'pt': 'Ir para Assinaturas',
      'en': 'Go to Subscriptions',
      'es': 'Ir a Suscripciones',
    },
    'kzdsnath': {
      'pt': 'Ir para Dashboard',
      'en': 'Go to Dashboard',
      'es': 'Ir al panel de control',
    },
    'up2fx3io': {
      'pt': 'Pagamento não confirmado!',
      'en': 'Payment not confirmed!',
      'es': '¡Pago no confirmado!',
    },
    '141d0pd1': {
      'pt':
          'Se realizou o pagamento a alteração pode levar algumas horas para ser processado. \nQuando o pagamento for confirmado, efetuaremos a verificação e sua assinatura será liberada.',
      'en':
          'If you made the payment, the change may take a few hours to be processed.\nWhen payment is confirmed, we will verify it and your signature will be released.',
      'es':
          'Si realizaste el pago, el cambio puede tardar unas horas en procesarse.\nCuando se confirme el pago, lo verificaremos y se liberará su firma.',
    },
    'f45xz1ek': {
      'pt': 'Ir para Dashboard',
      'en': 'Go to Dashboard',
      'es': 'Ir al panel de control',
    },
    '4jmm4sk2': {
      'pt': 'Registro não encontrado',
      'en': 'register not found',
      'es': 'registro no encontrado',
    },
    'vvkm6h99': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // User
  {
    'h92maiwy': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Relationships
  {
    '2fkrkvc0': {
      'pt': '',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // EditEvent
  {
    'o044r4f7': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // SignUp
  {
    'milywvll': {
      'pt': 'Novo ',
      'en': '',
      'es': '',
    },
    'cs8fwne4': {
      'pt': 'Usuário',
      'en': '',
      'es': '',
    },
    'ax2dey3i': {
      'pt':
          'Crie uma conta e faça parte da nossa comunidade, compartilhe suas experiências e faça amigos.',
      'en': '',
      'es': '',
    },
    '30epcolg': {
      'pt': 'Nome de Usuário',
      'en': '',
      'es': '',
    },
    'ic8tn3u7': {
      'pt': 'Digite seu nome de usuário',
      'en': '',
      'es': '',
    },
    '8dburc4c': {
      'pt': 'Email',
      'en': '',
      'es': '',
    },
    'vtqjhwue': {
      'pt': 'Digite seu email',
      'en': '',
      'es': '',
    },
    'mmmyju6i': {
      'pt': 'Senha',
      'en': '',
      'es': '',
    },
    'ctgbrw4h': {
      'pt': '********',
      'en': '',
      'es': '',
    },
    'eqh7tsgd': {
      'pt': 'Confirmar Senha',
      'en': '',
      'es': '',
    },
    '5jg8rvat': {
      'pt': '********',
      'en': '',
      'es': '',
    },
    'fq4d5lmx': {
      'pt': 'Cadastrar',
      'en': '',
      'es': '',
    },
    't6e6232a': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'uc5cmauk': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    '38y4nse1': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'fwtw5imi': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'p4qv0atr': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'kxxa39g8': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'j8g5ce9m': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'ha5srbll': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    '0bypa3i7': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PrivacyPolicy
  {
    'ooszcb5u': {
      'pt': 'Política de Privacidade',
      'en': 'Privacy Policy',
      'es': 'Política de privacidad',
    },
    'y0rtflqb': {
      'pt': 'placed',
      'en': 'placed',
      'es': 'metido',
    },
    'wo5l4zsy': {
      'pt':
          'Nossa empresa se compromete em respeitar a sua privacidade e a proteger seus dados pessoais. Esta Política de Privacidade descreve como coletamos, usamos, armazenamos e compartilhamos suas informações quando você utiliza nosso aplicativo tipo rede social com gestão de eventos e locais.',
      'en':
          'Our company is committed to respecting your privacy and protecting your personal data. This Privacy Policy describes how we collect, use, store and share your information when you use our social networking-style event and venue management application.',
      'es':
          'Nuestra empresa se compromete a respetar su privacidad y proteger sus datos personales. Esta Política de Privacidad describe cómo recopilamos, usamos, almacenamos y compartimos su información cuando utiliza nuestra aplicación de gestión de eventos y lugares estilo red social.',
    },
    '1xmize88': {
      'pt': '1. Informações coletadas:',
      'en': '1. Information collected:',
      'es': '1. Información recopilada:',
    },
    '7dsot9f9': {
      'pt':
          '- Dados pessoais: coletamos informações como nome, endereço de e-mail, data de nascimento, gênero e foto de perfil, para criar sua conta no aplicativo.\n- Informações de localização: permitimos que você compartilhe sua localização para personalizar a experiência no aplicativo e fornecer recomendações de eventos e locais próximos.\n- Informações de eventos e locais: quando você cria ou gerencia eventos e locais no aplicativo, coletamos informações relacionadas, como nome do evento ou local, data, descrição, fotos e comentários.',
      'en':
          '- Personal data: we collect information such as name, email address, date of birth, gender and profile photo, to create your account on the application.\n- Location information: We allow you to share your location to personalize your in-app experience and provide recommendations for nearby events and locations.\n- Event and venue information: When you create or manage events and venues in the app, we collect related information such as the event or venue name, date, description, photos and comments.',
      'es':
          '- Datos personales: recopilamos información como nombre, dirección de correo electrónico, fecha de nacimiento, sexo y foto de perfil, para crear su cuenta en la aplicación.\n- Información de ubicación: le permitimos compartir su ubicación para personalizar su experiencia en la aplicación y brindar recomendaciones para eventos y ubicaciones cercanas.\n- Información de eventos y lugares: cuando crea o administra eventos y lugares en la aplicación, recopilamos información relacionada, como el nombre del evento o lugar, fecha, descripción, fotos y comentarios.',
    },
    't75na811': {
      'pt': '2. Uso das informações:',
      'en': '2. Use of information:',
      'es': '2. Uso de la información:',
    },
    'w1glyxlo': {
      'pt':
          '- Personalização: utilizamos suas informações para personalizar a experiência no aplicativo, fornecendo recomendações de eventos e locais com base em seus interesses e localização.\n- Comunicação: podemos utilizar seu endereço de e-mail para enviar notificações e informações relevantes sobre eventos e locais que você estiver interessado.\n- Análise e melhoria: coletamos dados estatísticos e de uso do aplicativo para analisar o desempenho, identificar melhorias e oferecer uma experiência cada vez mais aprimorada.',
      'en':
          '- Personalization: We use your information to personalize your in-app experience by providing event and location recommendations based on your interests and location.\n- Communication: we may use your email address to send notifications and relevant information about events and locations that you are interested in.\n- Analysis and improvement: we collect statistical and application usage data to analyze performance, identify improvements and offer an increasingly improved experience.',
      'es':
          '- Personalización: utilizamos su información para personalizar su experiencia en la aplicación brindándole recomendaciones de eventos y ubicaciones basadas en sus intereses y ubicación.\n- Comunicación: podremos utilizar su dirección de correo electrónico para enviarle notificaciones e información relevante sobre eventos y lugares que le interesen.\n- Análisis y mejora: recopilamos datos estadísticos y de uso de las aplicaciones para analizar el rendimiento, identificar mejoras y ofrecer una experiencia cada vez mejor.',
    },
    'n0epri09': {
      'pt': '3. Compartilhamento de informações:',
      'en': '3. Information Sharing:',
      'es': '3. Intercambio de información:',
    },
    'ske950ck': {
      'pt':
          '- Com outros usuários: em conformidade com suas configurações de privacidade, poderemos compartilhar suas informações com outros usuários do aplicativo que estiverem interessados nos mesmos eventos ou locais.\n- Com terceiros: poderemos compartilhar informações com prestadores de serviços de hospedagem, análise de dados e envio de e-mails, desde que esses terceiros atendam aos requisitos de proteção de dados estabelecidos por nós.',
      'en':
          '- With other users: in accordance with your privacy settings, we may share your information with other users of the application who are interested in the same events or locations.\n- With third parties: we may share information with hosting, data analysis and email sending service providers, as long as these third parties meet the data protection requirements established by us.',
      'es':
          '- Con otros usuarios: de acuerdo con tu configuración de privacidad, podremos compartir tu información con otros usuarios de la aplicación que estén interesados ​​en los mismos eventos o ubicaciones.\n- Con terceros: podremos compartir información con proveedores de servicios de hosting, análisis de datos y envío de correo electrónico, siempre que estos terceros cumplan con los requisitos de protección de datos establecidos por nosotros.',
    },
    'bav3q2vr': {
      'pt': '4. Armazenamento e segurança:',
      'en': '4. Storage and security:',
      'es': '4. Almacenamiento y seguridad:',
    },
    '0scno7mk': {
      'pt':
          '- Armazenamento: suas informações são armazenadas em servidores seguros protegidos por medidas técnicas e organizacionais adequadas.\n- Retenção: mantemos suas informações pelo tempo necessário para cumprir com os propósitos descritos nesta Política de Privacidade ou conforme exigido por lei.\n- Segurança: implementamos medidas de segurança apropriadas para proteção contra acesso não autorizado, uso indevido ou divulgação de suas informações.',
      'en':
          '- Storage: your information is stored on secure servers protected by appropriate technical and organizational measures.\n- Retention: we keep your information for as long as necessary to fulfill the purposes described in this Privacy Policy or as required by law.\n- Security: We implement appropriate security measures to protect against unauthorized access, misuse or disclosure of your information.',
      'es':
          '- Almacenamiento: su información se almacena en servidores seguros protegidos por medidas técnicas y organizativas adecuadas.\n- Retención: conservamos su información durante el tiempo que sea necesario para cumplir con los fines descritos en esta Política de Privacidad o según lo exija la ley.\n- Seguridad: Implementamos medidas de seguridad adecuadas para proteger contra el acceso no autorizado, el mal uso o la divulgación de su información.',
    },
    'n2spw3i7': {
      'pt': '5. Consentimento e direitos do usuário:',
      'en': '5. User Consent and Rights:',
      'es': '5. Consentimiento y derechos del usuario:',
    },
    '9pw5pbiw': {
      'pt':
          '- Consentimento: ao utilizar nosso aplicativo, você consente com a coleta e uso de suas informações conforme descrito nesta Política de Privacidade.\n- Direitos do usuário: você tem o direito de acessar, corrigir ou excluir suas informações pessoais, bem como opor-se ao processamento delas, entrando em contato conosco através dos canais fornecidos no aplicativo.',
      'en':
          '- Consent: by using our application, you consent to the collection and use of your information as described in this Privacy Policy.\n- User rights: you have the right to access, correct or delete your personal information, as well as object to its processing, by contacting us through the channels provided in the application.',
      'es':
          '- Consentimiento: al utilizar nuestra aplicación, usted acepta la recopilación y el uso de su información como se describe en esta Política de Privacidad.\n- Derechos del usuario: tienes derecho a acceder, rectificar o suprimir tu información personal, así como a oponerte a su tratamiento, contactando con nosotros a través de los canales previstos en la aplicación.',
    },
    '1jtauspe': {
      'pt':
          'Esta Política de Privacidade pode ser atualizada periodicamente, portanto, recomendamos que você a consulte regularmente para verificar eventuais alterações.',
      'en':
          'This Privacy Policy may be updated periodically, therefore, we recommend that you consult it regularly to check for any changes.',
      'es':
          'Esta Política de Privacidad puede actualizarse periódicamente, por lo que le recomendamos que la consulte periódicamente para comprobar si hay cambios.',
    },
    '8guiiorv': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SeviceTerms
  {
    'zzr9lzg6': {
      'pt': 'Termos de Serviço',
      'en': 'Service Terms',
      'es': 'Términos de servicio',
    },
    '0s8h9gn7': {
      'pt': 'placed',
      'en': 'placed',
      'es': 'metido',
    },
    'w4znkudn': {
      'pt': '1. Aceitação dos termos de serviço',
      'en': '1. Acceptance of terms of service',
      'es': '1. Aceptación de los términos de servicio.',
    },
    '2ddvdyfq': {
      'pt':
          'Ao utilizar nosso aplicativo de rede social com gestão de eventos e locais, você concorda em cumprir e ser legalmente vinculado a estes termos de serviço. Se você não concordar com algum destes termos, por favor, não utilize nosso aplicativo.',
      'en':
          'By using our event and venue management social media application, you agree to comply with and be legally bound by these terms of service. If you do not agree with any of these terms, please do not use our application.',
      'es':
          'Al utilizar nuestra aplicación de redes sociales para la gestión de eventos y lugares, usted acepta cumplir y estar legalmente obligado por estos términos de servicio. Si no está de acuerdo con alguno de estos términos, no utilice nuestra aplicación.',
    },
    'sxrs0usq': {
      'pt': '2. Uso adequado do aplicativo',
      'en': '2. Proper use of the application',
      'es': '2. Uso adecuado de la aplicación',
    },
    'kwbvtn21': {
      'pt':
          'Você concorda em utilizar nosso aplicativo exclusivamente para fins legais e de acordo com todas as leis e regulamentos aplicáveis. Você não deve utilizar nosso aplicativo de maneira que possa prejudicar, desativar, sobrecarregar ou comprometer a segurança do aplicativo.',
      'en':
          'You agree to use our application exclusively for lawful purposes and in accordance with all applicable laws and regulations. You must not use our App in any way that could harm, disable, overburden, or compromise the security of the App.',
      'es':
          'Usted acepta utilizar nuestra aplicación exclusivamente para fines legales y de acuerdo con todas las leyes y regulaciones aplicables. No debe utilizar nuestra Aplicación de ninguna manera que pueda dañar, deshabilitar, sobrecargar o comprometer la seguridad de la Aplicación.',
    },
    'aq6zit6s': {
      'pt': '3. Conta do usuário',
      'en': '3. User Account',
      'es': '3. Cuenta de usuario',
    },
    'gb4sa095': {
      'pt':
          'Você pode precisar criar uma conta para utilizar nosso aplicativo. Ao criar uma conta, você concorda em fornecer informações precisas, atualizadas e completas. Você é responsável por todas as atividades que ocorrerem em sua conta e deve manter sua senha em sigilo.',
      'en':
          'You may need to create an account to use our application. By creating an account, you agree to provide accurate, current and complete information. You are responsible for all activities that occur under your account and must keep your password confidential.',
      'es':
          'Es posible que necesite crear una cuenta para utilizar nuestra aplicación. Al crear una cuenta, usted acepta proporcionar información precisa, actual y completa. Usted es responsable de todas las actividades que ocurren en su cuenta y debe mantener su contraseña confidencial.',
    },
    'q3ztsazh': {
      'pt': '4. Conteúdo gerado pelo usuário',
      'en': '4. User Generated Content',
      'es': '4. Contenido generado por el usuario',
    },
    'kioynu2j': {
      'pt':
          'Como usuário do aplicativo, você pode gerar conteúdo, como postagens, fotos e comentários. Você é responsável pelo conteúdo que criar e garantirá que ele não viole os direitos de terceiros, incluindo direitos autorais, marcas registradas, privacidade, publicidade ou outros direitos pessoais ou de propriedade.',
      'en':
          'As an app user, you can generate content such as posts, photos and comments. You are responsible for the content you create and will ensure that it does not violate the rights of any third party, including copyright, trademark, privacy, publicity or other personal or proprietary rights.',
      'es':
          'Como usuario de la aplicación, puedes generar contenido como publicaciones, fotos y comentarios. Usted es responsable del contenido que crea y se asegurará de que no viole los derechos de terceros, incluidos los derechos de autor, marcas comerciales, privacidad, publicidad u otros derechos personales o de propiedad.',
    },
    'siy0pda5': {
      'pt': '5. Direitos de propriedade',
      'en': '5. Property rights',
      'es': '5. Derechos de propiedad',
    },
    'bdrwwo2d': {
      'pt':
          'Todo o conteúdo presente no aplicativo, incluindo texto, imagens, vídeos, logotipos e design, é de propriedade exclusiva nossa ou de nossos licenciadores. Você não tem permissão para usar, reproduzir, modificar ou distribuir qualquer conteúdo do aplicativo sem nossa autorização prévia por escrito.',
      'en':
          'All content on the application, including text, images, videos, logos and design, is the exclusive property of us or our licensors. You are not permitted to use, reproduce, modify or distribute any content of the application without our prior written permission.',
      'es':
          'Todo el contenido de la aplicación, incluidos textos, imágenes, videos, logotipos y diseño, es propiedad exclusiva nuestra o de nuestros licenciantes. No se le permite utilizar, reproducir, modificar o distribuir ningún contenido de la aplicación sin nuestro permiso previo por escrito.',
    },
    '0xsf7s6y': {
      'pt': '6. Gestão de eventos e locais',
      'en': '6. Event and venue management',
      'es': '6. Gestión de eventos y lugares',
    },
    '9dkvkkq2': {
      'pt':
          'Nosso aplicativo permite que os usuários criem eventos e compartilhem informações sobre locais. Ao criar um evento ou compartilhar informações sobre um local, você concorda em fornecer informações precisas e atualizadas. Você é responsável por qualquer consequência decorrente das informações incorretas ou enganosas que você fornecer.',
      'en':
          'Our app allows users to create events and share information about locations. When creating an event or sharing information about a venue, you agree to provide accurate and up-to-date information. You are responsible for any consequences arising from incorrect or misleading information you provide.',
      'es':
          'Nuestra aplicación permite a los usuarios crear eventos y compartir información sobre ubicaciones. Al crear un evento o compartir información sobre un lugar, usted acepta proporcionar información precisa y actualizada. Usted es responsable de las consecuencias que surjan de la información incorrecta o engañosa que proporcione.',
    },
    'rmg5dllc': {
      'pt': '7. Privacidade',
      'en': '7. Privacy',
      'es': '7. Privacidad',
    },
    '789h9hx4': {
      'pt':
          'Valorizamos sua privacidade e protegemos suas informações pessoais de acordo com nossa Política de Privacidade. Recomendamos que você revise nossa Política de Privacidade para entender como coletamos, usamos e protegemos seus dados pessoais.',
      'en':
          'We value your privacy and protect your personal information in accordance with our Privacy Policy. We recommend that you review our Privacy Policy to understand how we collect, use and protect your personal data.',
      'es':
          'Valoramos su privacidad y protegemos su información personal de acuerdo con nuestra Política de Privacidad. Le recomendamos que revise nuestra Política de Privacidad para comprender cómo recopilamos, utilizamos y protegemos sus datos personales.',
    },
    'cat9qzqc': {
      'pt': '8. Disponibilidade e manutenção do aplicativo',
      'en': '8. Application availability and maintenance',
      'es': '8. Disponibilidad y mantenimiento de la aplicación',
    },
    'as4nifnu': {
      'pt':
          'Nos esforçamos para manter nosso aplicativo disponível e funcionando corretamente, mas não garantimos sua disponibilidade contínua e livre de erros. Podemos interromper o acesso ao aplicativo temporariamente para fins de manutenção, atualização ou outros motivos. Não nos responsabilizamos por qualquer interrupção ou indisponibilidade do aplicativo.',
      'en':
          'We strive to keep our application available and functioning correctly, but we do not guarantee its continuous or error-free availability. We may temporarily interrupt access to the application for maintenance, updating or other reasons. We are not responsible for any interruption or unavailability of the application.',
      'es':
          'Nos esforzamos por mantener nuestra aplicación disponible y funcionando correctamente, pero no garantizamos su disponibilidad continua o libre de errores. Podemos interrumpir temporalmente el acceso a la aplicación por mantenimiento, actualización u otros motivos. No somos responsables de ninguna interrupción o indisponibilidad de la aplicación.',
    },
    '86o6jkzl': {
      'pt': '9. Limitação de responsabilidade',
      'en': '9. Limitation of liability',
      'es': '9. Limitación de responsabilidad',
    },
    '2has3t0d': {
      'pt':
          'Em nenhuma circunstância seremos responsáveis por quaisquer danos diretos, indiretos, incidentais, especiais ou consequenciais decorrentes do uso ou incapacidade de uso do aplicativo, mesmo que tenhamos sido informados sobre a possibilidade de tais danos.',
      'en':
          'Under no circumstances will we be liable for any direct, indirect, incidental, special or consequential damages arising out of the use of or inability to use the application, even if we have been advised of the possibility of such damages.',
      'es':
          'Bajo ninguna circunstancia seremos responsables de ningún daño directo, indirecto, incidental, especial o consecuente que surja del uso o la imposibilidad de usar la aplicación, incluso si se nos ha advertido de la posibilidad de dichos daños.',
    },
    'od0yqrcn': {
      'pt': '10. Alterações nos termos de serviço',
      'en': '10. Changes to terms of service',
      'es': '10. Cambios en los términos de servicio.',
    },
    'v2rrpbwp': {
      'pt':
          'Reservamos o direito de modificar ou atualizar estes termos de serviço a qualquer momento, sem aviso prévio. As alterações entrarão em vigor assim que forem publicadas no aplicativo. É sua responsabilidade revisar periodicamente os termos de serviço para estar ciente de quaisquer modificações. O uso contínuo do aplicativo após a publicação das alterações constitui sua aceitação dos termos modificados.',
      'en':
          'We reserve the right to modify or update these terms of service at any time without prior notice. Changes will take effect as soon as they are published in the application. It is your responsibility to periodically review the terms of service to be aware of any modifications. Your continued use of the application after changes are posted constitutes your acceptance of the modified terms.',
      'es':
          'Nos reservamos el derecho de modificar o actualizar estos términos de servicio en cualquier momento sin previo aviso. Los cambios entrarán en vigor tan pronto como se publiquen en la aplicación. Es su responsabilidad revisar periódicamente los términos de servicio para estar al tanto de cualquier modificación. Su uso continuado de la aplicación después de que se publiquen los cambios constituye su aceptación de los términos modificados.',
    },
    'cr96ee6j': {
      'pt': '11. Rescisão',
      'en': '11. Termination',
      'es': '11. Terminación',
    },
    '2d8ofdbj': {
      'pt':
          'Podemos encerrar ou suspender sua conta ou seu acesso ao aplicativo a qualquer momento, por qualquer motivo, sem aviso prévio ou responsabilidade.\n',
      'en':
          'We may terminate or suspend your account or your access to the Application at any time, for any reason, without notice or liability.',
      'es':
          'Podemos cancelar o suspender su cuenta o su acceso a la Aplicación en cualquier momento, por cualquier motivo, sin previo aviso ni responsabilidad.',
    },
    'ymrprhzr': {
      'pt': '12. Disposições gerais',
      'en': '12. General provisions',
      'es': '12. Disposiciones generales',
    },
    'jlpiy3ea': {
      'pt':
          'Estes termos de serviço constituem o acordo completo entre você e nós, regendo o uso do nosso aplicativo, substituindo quaisquer acordos anteriores ou contemporâneos entre você e nós. Qualquer falha nossa em aplicar qualquer direito ou disposição destes termos de serviço não será considerada uma renúncia a esses direitos. Se qualquer disposição destes termos de serviço for considerada inválida ou inexequível por um tribunal competente, as demais disposições permanecerão em pleno vigor e efeito.\n',
      'en':
          'These Terms of Service constitute the entire agreement between you and us governing your use of our App, superseding any prior or contemporaneous agreements between you and us. Any failure by us to enforce any right or provision of these terms of service will not be considered a waiver of those rights. If any provision of these terms of service is found to be invalid or unenforceable by a court of competent jurisdiction, the remaining provisions will remain in full force and effect.',
      'es':
          'Estos Términos de servicio constituyen el acuerdo completo entre usted y nosotros que rige su uso de nuestra Aplicación, reemplazando cualquier acuerdo anterior o contemporáneo entre usted y nosotros. Cualquier incumplimiento por nuestra parte de hacer cumplir cualquier derecho o disposición de estos términos de servicio no se considerará una renuncia a esos derechos. Si un tribunal de jurisdicción competente determina que alguna disposición de estos términos de servicio es inválida o inaplicable, las disposiciones restantes permanecerán en pleno vigor y efecto.',
    },
    'b8psarwc': {
      'pt':
          'Estes termos de serviço serão regidos e interpretados de acordo com as leis do país onde a empresa operadora do aplicativo está localizada.',
      'en':
          'These terms of service will be governed by and construed in accordance with the laws of the country where the company operating the application is located.',
      'es':
          'Estos términos de servicio se regirán e interpretarán de acuerdo con las leyes del país donde se encuentra la empresa que opera la aplicación.',
    },
    '46mic39r': {
      'pt':
          'Estes termos de serviço foram atualizados pela última vez em 05/02/2024',
      'en': 'These terms of service were last updated on 02/05/2024',
      'es':
          'Estos términos de servicio se actualizaron por última vez el 05/02/2024.',
    },
    'a66yd0k4': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // DeleteAccount
  {
    'khubtu0m': {
      'pt': 'Back',
      'en': 'Back',
      'es': 'Atrás',
    },
    '2zi5lui7': {
      'pt': 'Deseja solicitar exclusão da sua conta?',
      'en': 'Do you want to request deletion of your account?',
      'es': '¿Quieres solicitar la eliminación de tu cuenta?',
    },
    'mc56gkxd': {
      'pt':
          'Se solicitar exclusao da sua conta, você não conseguira visualizar suas visitas, mensagens, amigos e não conseguirá recuperar estes dados\nTem certeza?',
      'en':
          'If you request deletion of your account, you will not be able to view your visits, messages, friends and you will not be able to recover this data\nHe is sure?',
      'es':
          'Si solicitas la eliminación de tu cuenta no podrás ver tus visitas, mensajes, amigos y no podrás recuperar estos datos.\n¿Está seguro?',
    },
    't1uipz5o': {
      'pt': 'Motivo da solicitação',
      'en': 'Reason for request',
      'es': 'Razón de la solicitud',
    },
    'az4gndbk': {
      'pt': 'Poderia descreva o motivo?',
      'en': 'Could you describe the reason?',
      'es': '¿Podrías describir el motivo?',
    },
    '2plfehyp': {
      'pt': 'Solicitar Exclusão',
      'en': 'Request Deletion',
      'es': 'Solicitar eliminación',
    },
    '346l9rjf': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Onboarding
  {
    '4ot5o7zz': {
      'pt': 'Seja ',
      'en': '',
      'es': '',
    },
    'aiiw99m6': {
      'pt': 'bem vindo',
      'en': '',
      'es': '',
    },
    'ku5ps9r3': {
      'pt':
          'Ao visitar um local veja outros visitantes, faça amigos, veja quem gostou de você e compartilhe suas experiencias.',
      'en': '',
      'es': '',
    },
    'waoeeui8': {
      'pt': 'Compartilhe suas\n',
      'en': '',
      'es': '',
    },
    'csczii0y': {
      'pt': 'Experiências',
      'en': '',
      'es': '',
    },
    '6bpxuuyi': {
      'pt':
          'Pesquise por locais e eventos proximos a você, veja usuarios estão o local, suas avaliações, crie e compartilhe seus eventos.',
      'en': '',
      'es': '',
    },
    'k3aiddra': {
      'pt': 'Conte sobre você',
      'en': '',
      'es': '',
    },
    'nlhc08lj': {
      'pt':
          'Compartilhe suas informações para que outros usuários possam conhecer, entrar em contato e começar uma amizade.',
      'en': '',
      'es': '',
    },
    'ovgt9mhb': {
      'pt': 'Nome...',
      'en': '',
      'es': '',
    },
    '9pmnijdt': {
      'pt': 'Sobre ...',
      'en': '',
      'es': '',
    },
    'eg04o4np': {
      'pt': 'Envie suas fotos',
      'en': '',
      'es': '',
    },
    'nkxbi8of': {
      'pt':
          'Compartilhe suas fotos para que outros usuários possam ver e encontrar você.',
      'en': '',
      'es': '',
    },
    '2hng5pwk': {
      'pt': 'Enviar imagem',
      'en': '',
      'es': '',
    },
    'kucgltp7': {
      'pt': 'Vamos lá',
      'en': '',
      'es': '',
    },
    '1nfuj7kt': {
      'pt': 'Fechar',
      'en': '',
      'es': '',
    },
    'blp49ntn': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Visit
  {
    '7zr3u7h2': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Profile
  {
    'mtntjw9z': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // ProfileEdit
  {
    '2l3a1nsx': {
      'pt': 'Editar ',
      'en': '',
      'es': '',
    },
    '3nnjeapn': {
      'pt': 'Perfil do Usuário',
      'en': '',
      'es': '',
    },
    'fzirj447': {
      'pt': 'Imagens',
      'en': '',
      'es': '',
    },
    '2ve9czss': {
      'pt': 'Nome',
      'en': '',
      'es': '',
    },
    '0v02cdhn': {
      'pt': 'Username',
      'en': '',
      'es': '',
    },
    '98xssd5w': {
      'pt': 'Telefone',
      'en': '',
      'es': '',
    },
    'al7hpsna': {
      'pt': 'Data de Nascimento',
      'en': '',
      'es': '',
    },
    '72yr1psm': {
      'pt': 'Sobre mim',
      'en': '',
      'es': '',
    },
    'mt9iy9r9': {
      'pt': 'Links',
      'en': '',
      'es': '',
    },
    '18wrgmeo': {
      'pt': 'whatsapp.com /',
      'en': '',
      'es': '',
    },
    '00vr9agy': {
      'pt': 'number...',
      'en': '',
      'es': '',
    },
    '3irtkyq8': {
      'pt': 'instagram.com /',
      'en': '',
      'es': '',
    },
    'sg44o90y': {
      'pt': 'username...',
      'en': '',
      'es': '',
    },
    'be60ez1n': {
      'pt': 'facebook.com /',
      'en': '',
      'es': '',
    },
    'z9i7ll4t': {
      'pt': 'username...',
      'en': '',
      'es': '',
    },
    'gu4knxs2': {
      'pt': 'twitter.com /',
      'en': '',
      'es': '',
    },
    '2guw1mtu': {
      'pt': 'username...',
      'en': '',
      'es': '',
    },
    'xilnke5j': {
      'pt': 'Interesses',
      'en': '',
      'es': '',
    },
    '9avbz1m6': {
      'pt': 'Amizades',
      'en': '',
      'es': '',
    },
    '1cvxyw4a': {
      'pt': 'Relacionamentos',
      'en': '',
      'es': '',
    },
    'cafehcys': {
      'pt': 'Privacidade de dados',
      'en': '',
      'es': '',
    },
    'iqc49122': {
      'pt': 'Exibir no perfil locais favoritos ',
      'en': '',
      'es': '',
    },
    '4w03dexx': {
      'pt': 'Exibir no perfil eventos confirmados',
      'en': '',
      'es': '',
    },
    'm4k6yy85': {
      'pt': 'Exibir links no perfil para',
      'en': '',
      'es': '',
    },
    'oh1pm1b4': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'ehtqb1ns': {
      'pt': 'Quem Gostei',
      'en': '',
      'es': '',
    },
    'q1ymppin': {
      'pt': 'Não Exibir',
      'en': '',
      'es': '',
    },
    'k44z77cl': {
      'pt': 'Selecione',
      'en': '',
      'es': '',
    },
    '8h6dsb15': {
      'pt': 'Search for an item...',
      'en': '',
      'es': '',
    },
    'dtpliqhi': {
      'pt': 'Desconectar da conta',
      'en': '',
      'es': '',
    },
    'fvm5wfy9': {
      'pt': 'Excluir Conta',
      'en': '',
      'es': '',
    },
    'anbjy6tf': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CreateSubscriptions
  {
    'bpvlfypd': {
      'pt': 'Encontre o local que gostaria de assinar',
      'en': '',
      'es': '',
    },
    'pxonceos': {
      'pt': 'Selecione o endereço',
      'en': '',
      'es': '',
    },
    '9nsdtp7y': {
      'pt': 'Pesquisar por nome...',
      'en': '',
      'es': '',
    },
    '5qjkkzjk': {
      'pt':
          'Ao visitar um local veja outros visitantes, faça amigos, veja quem gostou de você e compartilhe suas experiencias.',
      'en': '',
      'es': '',
    },
    '2mn5ivyw': {
      'pt': 'fechar',
      'en': '',
      'es': '',
    },
    'hu1jz8r7': {
      'pt': 'Encontre Locais e eventos proximos ',
      'en': '',
      'es': '',
    },
    'uonr8cml': {
      'pt':
          'Pesquise por locais e eventos proximos a você, veja usuarios estão o local, suas avaliações, crie e compartilhe seus eventos.',
      'en': '',
      'es': '',
    },
    'mnzln7f1': {
      'pt': 'Tudo Pronto ',
      'en': '',
      'es': '',
    },
    'ot37xalw': {
      'pt':
          'Seja bem vindo a nossa comunidade!\nEsperamos que você consiga encontrar varios amigos e que tenha experiencias incríveis.',
      'en': '',
      'es': '',
    },
    'e184putm': {
      'pt': 'Vamos lá',
      'en': '',
      'es': '',
    },
    '02ozd1bw': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // Subscription
  {
    'syotu5sp': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // SubscriptionCopy
  {
    'vesucas0': {
      'pt': 'Nova Assinatura',
      'en': '',
      'es': '',
    },
    '69n7rpx1': {
      'pt': ' - 3',
      'en': '',
      'es': '',
    },
    'l1c2twfj': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // Posts
  {
    '2zuf6eqt': {
      'pt': 'Publicações',
      'en': '',
      'es': '',
    },
    'sj8o89uo': {
      'pt': 'Shop',
      'en': '',
      'es': '',
    },
  },
  // Cart
  {
    'osjw43fx': {
      'pt': 'Carrinho',
      'en': '',
      'es': '',
    },
    'eurn16mq': {
      'pt': 'Limpar',
      'en': '',
      'es': '',
    },
    '8b49uepw': {
      'pt': 'R\$54,00',
      'en': '',
      'es': '',
    },
    'b59yx4h0': {
      'pt': 'Base Price',
      'en': '',
      'es': '',
    },
    'b0597kpy': {
      'pt': '\$156.00',
      'en': '',
      'es': '',
    },
    '2wys2ow1': {
      'pt': 'Taxes',
      'en': '',
      'es': '',
    },
    'gks5cx5p': {
      'pt': '\$24.20',
      'en': '',
      'es': '',
    },
    'apxazaiy': {
      'pt': 'Cleaning Fee',
      'en': '',
      'es': '',
    },
    'qsqajbc9': {
      'pt': '\$40.00',
      'en': '',
      'es': '',
    },
    '4o9dm6vw': {
      'pt': 'Total',
      'en': '',
      'es': '',
    },
    'j4khui3r': {
      'pt': '\$230.20',
      'en': '',
      'es': '',
    },
    'jcki8rr6': {
      'pt': 'Total',
      'en': '',
      'es': '',
    },
    '8mgjp74l': {
      'pt': 'R\$120,00',
      'en': '',
      'es': '',
    },
    'kou1ui4q': {
      'pt': '/ 2 itens',
      'en': '',
      'es': '',
    },
    '49pei4jj': {
      'pt': 'Finalizar Compra',
      'en': '',
      'es': '',
    },
    'izs361nv': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // ProductDetails
  {
    'nzgl1dc1': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'ov4mk110': {
      'pt': 'Observações',
      'en': '',
      'es': '',
    },
    'mfc9pt8p': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'd1de7116': {
      'pt':
          'Digite suas observações sobre o produto aqui (tirar cebola, ketchup, ...)',
      'en': '',
      'es': '',
    },
    '94xo94tx': {
      'pt': 'Adicionar ao carrinho',
      'en': '',
      'es': '',
    },
    '3zp8oqpn': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // PlaceMenu
  {
    'ovg6za78': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // CreateProduct
  {
    '3h78mrhz': {
      'pt': 'Create Product',
      'en': '',
      'es': '',
    },
    'erh7233i': {
      'pt': 'Fill out the information below to post a product',
      'en': '',
      'es': '',
    },
    '2uxw8srt': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // StartPage
  {
    'ouevrlc1': {
      'pt': 'placed',
      'en': '',
      'es': '',
    },
    '4s7ch9hw': {
      'pt': 'Venha compartilhar suas',
      'en': '',
      'es': '',
    },
    'sqc1j4ps': {
      'pt': ' experiências',
      'en': '',
      'es': '',
    },
    'cnkstbb5': {
      'pt': 'Cadastrar com Email',
      'en': 'Sign up with e-mail',
      'es': '',
    },
    '1c8righ9': {
      'pt': 'Ou com redes sociais:',
      'en': '',
      'es': '',
    },
    'e93qqdin': {
      'pt': 'Cadastrar com Google',
      'en': 'Sign up with Google',
      'es': '',
    },
    '7rd5j4dj': {
      'pt': 'Cadastrar com Facebook',
      'en': 'Sign up with Facebook',
      'es': '',
    },
    'oleiiox8': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // LogIn
  {
    'yoagi9my': {
      'pt': 'Faça seu ',
      'en': 'Make yours',
      'es': 'Haz tu',
    },
    'kph1o93a': {
      'pt': 'Login',
      'en': 'Login',
      'es': 'Acceso',
    },
    'tha22aoe': {
      'pt':
          'Bem vindo de volta, faça login para ter acesso a nossa comunidade e compatilhar suas experiências',
      'en':
          'Welcome back, log in to access our community and share your experiences',
      'es':
          'Bienvenido de nuevo, inicia sesión para acceder a nuestra comunidad y compartir tus experiencias.',
    },
    'yaxfmcr3': {
      'pt': 'Email',
      'en': 'E-mail',
      'es': 'Correo electrónico',
    },
    'pyraghps': {
      'pt': 'Digite seu email',
      'en': 'Enter your email',
      'es': 'Introduce tu correo electrónico',
    },
    'eagxvw39': {
      'pt': 'Senha',
      'en': 'Password',
      'es': 'Contraseña',
    },
    '16f75cfl': {
      'pt': '********',
      'en': '********',
      'es': '********',
    },
    'pivg4ck5': {
      'pt': 'Entrar',
      'en': 'To enter',
      'es': 'para entrar',
    },
    'v71x94pa': {
      'pt': 'Ou com redes sociais:',
      'en': 'Or with social networks:',
      'es': 'O con las redes sociales:',
    },
    'wbb5wb89': {
      'pt': 'Login com Google',
      'en': 'Login with Google',
      'es': 'Iniciar sesión con Google',
    },
    'lh9h2guo': {
      'pt': 'Login com Facebook',
      'en': 'Login with Facebook',
      'es': 'Iniciar sesión con Facebook',
    },
    'rbdfko71': {
      'pt': 'Este campo é obrigatório',
      'en': 'Mandatory field',
      'es': 'Campo obligatorio',
    },
    '62rrefy1': {
      'pt': 'Selecione uma opção',
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'o9gxhl7k': {
      'pt': 'Este campo é obrigatório',
      'en': 'Field is required',
      'es': '',
    },
    'qqhtjldc': {
      'pt': 'Selecione uma opção',
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    '8acy442x': {
      'pt': 'Este campo é obrigatório',
      'en': 'Field is required',
      'es': '',
    },
    'tsemmwiw': {
      'pt': 'Selecione uma opção',
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'ce6o41lz': {
      'pt': 'Este campo é obrigatório',
      'en': 'Field is required',
      'es': '',
    },
    'ez4v9u9i': {
      'pt': 'Selecione uma opção',
      'en': 'Please choose an option from the dropdown',
      'es': '',
    },
    'r84jyyjg': {
      'pt': 'Home',
      'en': 'Home',
      'es': 'Hogar',
    },
  },
  // CreateEvent
  {
    'v10rs4e6': {
      'pt': 'Criar',
      'en': '',
      'es': '',
    },
    'gn0c247j': {
      'pt': ' Evento Presencial',
      'en': '',
      'es': '',
    },
    'zwdwjuxc': {
      'pt': 'Informações Básicas',
      'en': '',
      'es': '',
    },
    'bxykrzau': {
      'pt': 'Descreva as principais informações sobre o evento',
      'en': '',
      'es': '',
    },
    '888dqwec': {
      'pt': 'Nome do evento',
      'en': '',
      'es': '',
    },
    'z23scqv9': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'qsf42tq0': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'wjgrau9g': {
      'pt': 'Descrição do evento',
      'en': '',
      'es': '',
    },
    'vjkbm04e': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'b2saz1y5': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'xdf6ldes': {
      'pt': 'Data de Início',
      'en': '',
      'es': '',
    },
    'bobq3w3u': {
      'pt': 'Selecione...',
      'en': '',
      'es': '',
    },
    '86xqpikf': {
      'pt': 'Data de Término',
      'en': '',
      'es': '',
    },
    '94vhph47': {
      'pt': 'Selecione...',
      'en': '',
      'es': '',
    },
    '3ko7non6': {
      'pt': 'Categoria',
      'en': '',
      'es': '',
    },
    'z2vju4qf': {
      'pt': 'Option 1',
      'en': '',
      'es': '',
    },
    'pls9iwdg': {
      'pt': 'Option 2',
      'en': '',
      'es': '',
    },
    'do1mb9ni': {
      'pt': 'Option 3',
      'en': '',
      'es': '',
    },
    'eej8d9mx': {
      'pt': 'Selecione uma categoria...',
      'en': '',
      'es': '',
    },
    '5i96vs33': {
      'pt': 'Search...',
      'en': '',
      'es': '',
    },
    '36cbvr5p': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'bt0z87n8': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'b1nblp59': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'lcghuhnf': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'vszfgmdi': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'sqrre8p7': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    'd1n3lbbp': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'dyjsyhrp': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
    '0ry4mfmq': {
      'pt': 'Avançar',
      'en': '',
      'es': '',
    },
    'i1mlmo0u': {
      'pt': 'Endereço do Evento',
      'en': '',
      'es': '',
    },
    'gv6mv5tn': {
      'pt': 'Descreva onde seu evento vai acontecer',
      'en': '',
      'es': '',
    },
    'gaqnmd75': {
      'pt': 'Informe o endereço do evento',
      'en': '',
      'es': '',
    },
    'y2lzqa8l': {
      'pt': 'Nome do local',
      'en': '',
      'es': '',
    },
    'xgufa2e5': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'ft20camr': {
      'pt': 'CEP',
      'en': '',
      'es': '',
    },
    'cu23fzdx': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'srqv11dn': {
      'pt': 'Endereço',
      'en': '',
      'es': '',
    },
    'kea91g0v': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    '1wzjbcur': {
      'pt': 'Complemento',
      'en': '',
      'es': '',
    },
    '6fibsgn0': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    '907a8a1h': {
      'pt': 'Bairro',
      'en': '',
      'es': '',
    },
    'v0oy8i86': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'vbv3hqp7': {
      'pt': 'Cidade',
      'en': '',
      'es': '',
    },
    'ny2zwi7c': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'ngs069mf': {
      'pt': 'Estado',
      'en': '',
      'es': '',
    },
    'zqysw8al': {
      'pt': 'TextField',
      'en': '',
      'es': '',
    },
    'fpr8k10q': {
      'pt': 'Avançar',
      'en': '',
      'es': '',
    },
    'tlvwx295': {
      'pt': 'Imagens do evento',
      'en': '',
      'es': '',
    },
    '037sn5bt': {
      'pt':
          'Adicione  as imagems que vão ser exibidas na página do evento. A dimensão recomendada é 1200 x 1200.',
      'en': '',
      'es': '',
    },
    'bwk1yb28': {
      'pt': 'Enviar Imagem do Evento',
      'en': '',
      'es': '',
    },
    'octc76zm': {
      'pt': 'Avançar',
      'en': '',
      'es': '',
    },
    's3vvuh2s': {
      'pt': 'Home',
      'en': '',
      'es': '',
    },
  },
  // reviewPlace
  {
    'k19o8fb2': {
      'pt': 'Avalie sua visita',
      'en': 'Rate Your Trip',
      'es': 'Califica tu viaje',
    },
    '59gq9nxe': {
      'pt': 'Nos conte o que você achou desta visita!',
      'en': 'Let us know what you thought of the place below!',
      'es': '¡Cuéntanos qué te pareció el lugar a continuación!',
    },
    '7qi8jw4y': {
      'pt': 'Como você avalia no geral?',
      'en': 'How would you rate it?',
      'es': '¿Cómo lo calificarías?',
    },
    '9sejcbyn': {
      'pt': 'Como foi sua expreriência no local?',
      'en': 'Please leave a description of the place...',
      'es': 'Por favor deja una descripción del lugar...',
    },
    'gn3u4uqj': {
      'pt': 'Enviar Avaliação',
      'en': 'Submit Review',
      'es': 'Enviar opinión',
    },
  },
  // PlaceMenuPage
  {
    't8igb1fl': {
      'pt': 'Menu',
      'en': '',
      'es': '',
    },
    'jq93vcgo': {
      'pt': 'Sem produtos cadastrados',
      'en': '',
      'es': '',
    },
    'xau3trnq': {
      'pt': 'mais informações',
      'en': '',
      'es': '',
    },
    'xkl8idgp': {
      'pt': 'R\$ 34,00',
      'en': '',
      'es': '',
    },
    'rswama9n': {
      'pt': 'R\$0,00',
      'en': '',
      'es': '',
    },
  },
  // appTopBar
  {
    'sp0x6xji': {
      'pt': 'Cancel',
      'en': 'Cancel',
      'es': 'Cancelar',
    },
    'jidklu5b': {
      'pt': 'Login',
      'en': 'Login',
      'es': 'Acceso',
    },
  },
  // List_Event
  {
    '475n84vx': {
      'pt': '\n',
      'en': '',
      'es': '',
    },
    '4nbk1au9': {
      'pt': '+',
      'en': '+',
      'es': '+',
    },
  },
  // List_V_Place
  {
    'goua1p9e': {
      'pt': '\nkm',
      'en': 'km',
      'es': 'kilómetros',
    },
    '752lo2wh': {
      'pt': '+',
      'en': '+',
      'es': '+',
    },
    'ubzv63l5': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    'axhw6cc0': {
      'pt': 'Rock & Electronic',
      'en': 'Rock & Electronic',
      'es': 'Rock y electrónica',
    },
  },
  // subscriptionPlan
  {
    'rtshu7gc': {
      'pt': 'R\$',
      'en': '',
      'es': '',
    },
    'tcddzmpo': {
      'pt': 'mensal',
      'en': '/ month',
      'es': '/mes',
    },
    'ub68cwoh': {
      'pt': 'Assinar',
      'en': 'To sign',
      'es': 'Para firmar',
    },
  },
  // SubProductInList
  {
    'ptq9keeo': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    'i1gf8w8d': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
  },
  // StripeProductView
  {
    'ehauwl67': {
      'pt': 'R\$',
      'en': 'R\$',
      'es': 'R\$',
    },
    '11dvm7t4': {
      'pt': 'Button',
      'en': 'button',
      'es': 'botón',
    },
  },
  // PlaceAddPost
  {
    'bwgyjw59': {
      'pt': 'Label here...',
      'en': 'Label here...',
      'es': 'Etiqueta aquí...',
    },
    'jp96oa43': {
      'pt': 'Publicar',
      'en': 'Publish',
      'es': 'Publicar',
    },
  },
  // Post
  {
    'jovhdig2': {
      'pt': '205k',
      'en': '',
      'es': '',
    },
  },
  // UserBanner
  {
    '8jc8oyb4': {
      'pt': 'gostou de você',
      'en': 'liked you',
      'es': 'te ha gustado',
    },
    '934l0eys': {
      'pt': 'amigo',
      'en': 'friend',
      'es': 'amigo',
    },
    'ly5xm9rg': {
      'pt': 'quer ser seu amigo',
      'en': 'wants to be your friend',
      'es': 'quiere ser tu amigo',
    },
    'byjvtbub': {
      'pt': 'amigo',
      'en': 'friend',
      'es': 'amigo',
    },
    '59i002al': {
      'pt': 'amizade solicitada',
      'en': 'friendship requested',
      'es': 'amistad solicitada',
    },
    'rwrnu4ls': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'mq6q2cxc': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    'qc2e40gv': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
  },
  // searchFilter
  {
    '7cxmtx3u': {
      'pt': 'Cancel Trip',
      'en': 'CancelTrip',
      'es': 'Cancelar viaje',
    },
    'dy2t8y0e': {
      'pt': 'Label here...',
      'en': 'Label here...',
      'es': 'Etiqueta aquí...',
    },
    '5o4mq932': {
      'pt': 'Yes, Cancel Trip',
      'en': 'Yes, Cancel Trip',
      'es': 'Sí, cancelar viaje',
    },
    'g3u687pu': {
      'pt': 'Never Mind',
      'en': 'Never Mind',
      'es': 'No importa',
    },
  },
  // placeProductView
  {
    '2pvg1pft': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    '7jltmd7g': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
    '6oqakflo': {
      'pt': 'Hello World',
      'en': 'Hello World',
      'es': 'Hola Mundo',
    },
  },
  // placed_logo
  {
    'pr8nwe3t': {
      'pt': 'placed',
      'en': 'placed',
      'es': 'metido',
    },
  },
  // ChatUserLikes
  {
    '8pui5yxd': {
      'pt': 'Gostou de você',
      'en': 'Liked you',
      'es': 'Te ha gustado',
    },
  },
  // ChatUserFriends
  {
    'wk7amig3': {
      'pt': 'Gostou de você',
      'en': 'Liked you',
      'es': 'Te ha gustado',
    },
  },
  // PostInGrid
  {
    'vhrw8z13': {
      'pt': 'Sem Image',
      'en': '',
      'es': '',
    },
  },
  // DNewPost
  {
    '0wdbadjv': {
      'pt': 'Nova publicação',
      'en': 'New publication',
      'es': 'Nueva publicación',
    },
    'clavhuua': {
      'pt': 'Texto',
      'en': 'Text',
      'es': 'Texto',
    },
    'p1g2k7k4': {
      'pt': 'Descreva sua publicação...',
      'en': 'Describe your publication...',
      'es': 'Describe tu publicación...',
    },
    'vkbpcfml': {
      'pt': 'Vincular com visita',
      'en': 'Link with visit',
      'es': 'Enlace con visita',
    },
    '7x1ohe1f': {
      'pt': 'Publicar',
      'en': 'Publish',
      'es': 'Publicar',
    },
  },
  // DashUserNext
  {
    '64mj6eqp': {
      'pt': 'Usuários proxímos',
      'en': 'Nearby users',
      'es': 'Usuarios cercanos',
    },
    'xhsm01yb': {
      'pt': 'Todos',
      'en': 'All',
      'es': 'Todo',
    },
    '5npvx0z0': {
      'pt': 'Realize o login para visualizar usuários próximos',
      'en': 'Log in to view nearby users',
      'es': 'Inicia sesión para ver usuarios cercanos',
    },
  },
  // FormNewEvent
  {
    'lncqzavz': {
      'pt': 'Novo Evento',
      'en': 'New Event',
      'es': 'Nuevo evento',
    },
    'g69glhh1': {
      'pt': 'Nome do evento',
      'en': 'Event name',
      'es': 'Nombre del evento',
    },
    '6zajr3p8': {
      'pt': 'DIgite o nome do seu evento...',
      'en': 'Enter the name of your event...',
      'es': 'Introduce el nombre de tu evento...',
    },
    'yh3eo2jg': {
      'pt': 'Descrição',
      'en': 'Description',
      'es': 'Descripción',
    },
    'vqedgl57': {
      'pt': 'Descreva seu evento...',
      'en': 'Describe your event...',
      'es': 'Describe tu evento...',
    },
    'nhjddy63': {
      'pt': 'Inicio do evento',
      'en': 'Start of the event',
      'es': 'Inicio del evento',
    },
    'jznwfm6c': {
      'pt': 'Fim do evento',
      'en': 'End of event',
      'es': 'Fin del evento',
    },
    'rqzhbnq1': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    'tet36429': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'zk4g5ge4': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    'djwh1w5q': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'wzp5ogdr': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    'loti1vg7': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '054hhsm1': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    '2ls63w1j': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    'ad68kgau': {
      'pt': 'Cadastrar',
      'en': 'Register',
      'es': 'Registrar',
    },
  },
  // appTopBarPlace
  {
    'sed6ttal': {
      'pt': 'VOLTAR',
      'en': '',
      'es': '',
    },
  },
  // profileTabs
  {
    'jtel93dj': {
      'pt': 'Postagens',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'oujaxqi8': {
      'pt': 'Informações',
      'en': 'Information',
      'es': 'Información',
    },
    'nw5yz0b5': {
      'pt': 'Sobre',
      'en': 'About',
      'es': 'Acerca de',
    },
    'zhgyib4u': {
      'pt': 'Tenho interesse em amizades',
      'en': 'I\'m interested in friendships',
      'es': 'me interesan las amistades',
    },
    'df6xa4rr': {
      'pt': 'Homens',
      'en': 'Men',
      'es': 'Hombres',
    },
    '7552nfnb': {
      'pt': 'Mulheres',
      'en': 'Women',
      'es': 'Mujer',
    },
    'r3fu6bhi': {
      'pt': 'Tenho interesse em relacionamentos',
      'en': 'I\'m interested in relationships',
      'es': 'estoy interesado en las relaciones',
    },
    'tx2gh5r8': {
      'pt': 'Homens',
      'en': 'Men',
      'es': 'Hombres',
    },
    't3e5t7r5': {
      'pt': 'Mulheres',
      'en': 'Women',
      'es': 'Mujer',
    },
    '8ly8epek': {
      'pt': 'Categorias de interesse',
      'en': 'Categories of interest',
      'es': 'Categorías de interés',
    },
    'u5lqurxt': {
      'pt': 'Locais favoritos',
      'en': 'Favorite places',
      'es': 'Lugares favoritos',
    },
    'dx46fzuo': {
      'pt': 'Locais favoritos',
      'en': 'Favorite places',
      'es': 'Lugares favoritos',
    },
  },
  // PostCommentList
  {
    'qnhlpbyx': {
      'pt': 'Experiência por:',
      'en': '',
      'es': '',
    },
  },
  // AuthUserChangeUsername
  {
    'il20zgyn': {
      'pt': 'Alterar nome de usuario',
      'en': 'Change username',
      'es': 'Cambie el nombre de usuario',
    },
    'cyywvxrn': {
      'pt': 'Digite o nome de usuário...',
      'en': 'Enter username...',
      'es': 'Introduzca su nombre de usuario...',
    },
    'jo7m0b8t': {
      'pt': 'Field is required',
      'en': 'Field is required',
      'es': 'Se requiere campo',
    },
    'ghmy6okc': {
      'pt': 'Minimo de 5 caracteres',
      'en': 'Minimum 5 characters',
      'es': 'Mínimo 5 caracteres',
    },
    '2qv7nrtd': {
      'pt': 'Maximo de 20 caracteres',
      'en': 'Maximum 20 characters',
      'es': 'Máximo 20 caracteres',
    },
    '3b4t8i1p': {
      'pt': 'Username já existe ou invalido',
      'en': 'Username already exists or invalid',
      'es': 'El nombre de usuario ya existe o no es válido',
    },
    'z3ksshnb': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
    '8xecpdls': {
      'pt': 'Atualizar',
      'en': 'To update',
      'es': 'Actualizar',
    },
  },
  // NotificationInList
  {
    'g3jpooc3': {
      'pt': 'Notificação',
      'en': 'Notification',
      'es': 'Notificación',
    },
  },
  // VisitPlaceButton
  {
    'vyw3dmts': {
      'pt': 'Finalizar Visita',
      'en': 'End Visit',
      'es': 'Finalizar visita',
    },
    'hw4kzk6p': {
      'pt': 'Iniciar Visita',
      'en': 'Start Visit',
      'es': 'Iniciar visita',
    },
    's8lf4rum': {
      'pt': 'Iniciar Visita',
      'en': 'Start Visit',
      'es': 'Iniciar visita',
    },
  },
  // VisitEventButton
  {
    'cn9cxech': {
      'pt': 'Confirmado',
      'en': 'Confirmed',
      'es': 'Confirmado',
    },
    'da8ubd8f': {
      'pt': 'Vou',
      'en': 'I go',
      'es': 'Voy',
    },
    'n9whgehz': {
      'pt': 'Finalizar Visita',
      'en': 'End Visit',
      'es': 'Finalizar visita',
    },
    'npbksj0e': {
      'pt': 'Participar',
      'en': 'To participate',
      'es': 'Para participar',
    },
    'rtvurwgd': {
      'pt': 'Participar',
      'en': 'To participate',
      'es': 'Para participar',
    },
    'fgesky10': {
      'pt': 'Evento Finalizado',
      'en': 'Event Finished',
      'es': 'Evento terminado',
    },
  },
  // UserProfile
  {
    '70wdiu6k': {
      'pt': 'Editar Perfil',
      'en': '',
      'es': '',
    },
    'ylnk1qaf': {
      'pt': 'posts',
      'en': '',
      'es': '',
    },
    'jbjms79e': {
      'pt': 'likes',
      'en': '',
      'es': '',
    },
    'bel1r4s3': {
      'pt': 'visitas',
      'en': '',
      'es': '',
    },
    '49rus4kn': {
      'pt': 'Amizades com : ',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    'tzoyv17x': {
      'pt': 'Todos',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    'lnw8yw49': {
      'pt': 'Homens',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    '5knb5oyr': {
      'pt': 'Mulheres',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    'kywscxcg': {
      'pt': 'Sem interesse',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    '5deurb5m': {
      'pt': 'Relacionamentos com:',
      'en': 'I am interested in relationships with:',
      'es': 'Estoy interesado en relaciones con:',
    },
    'x58xdnn9': {
      'pt': 'Todos',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    'r9ypu8al': {
      'pt': 'Homens',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    '8ozdskfn': {
      'pt': 'Mulheres',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    '5bq0c1pn': {
      'pt': 'Sem interesse',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    '2axb2syp': {
      'pt': 'sem avaliações',
      'en': '',
      'es': '',
    },
  },
  // ProfileTabVisits
  {
    'zzn7ckid': {
      'pt': 'Minhas visitas',
      'en': 'My visits',
      'es': 'mis visitas',
    },
    'mmapile8': {
      'pt': 'Avaliar',
      'en': '',
      'es': '',
    },
    'pjrzjf2q': {
      'pt': 'null ref',
      'en': 'nullref',
      'es': 'referencia nula',
    },
  },
  // UserProfileTabs
  {
    '56burmgq': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    '2lnub5yw': {
      'pt': 'Sobre',
      'en': 'About',
      'es': 'Acerca de',
    },
    'wr33kzwv': {
      'pt': 'Sobre',
      'en': 'About',
      'es': 'Acerca de',
    },
    '8b7nl8k8': {
      'pt': 'Tenho interesse em amizades com:',
      'en': 'I am interested in friendships with:',
      'es': 'Estoy interesado en amistades con:',
    },
    'tleh1izt': {
      'pt': 'Homens',
      'en': 'Men',
      'es': 'Hombres',
    },
    's9p031ns': {
      'pt': 'Mulheres',
      'en': 'Women',
      'es': 'Mujer',
    },
    'evtzjy6a': {
      'pt': 'Tenho interesse em relacionamentos com:',
      'en': 'I am interested in relationships with:',
      'es': 'Estoy interesado en relaciones con:',
    },
    'k8qihbfo': {
      'pt': 'Homens',
      'en': 'Men',
      'es': 'Hombres',
    },
    '23giaxc5': {
      'pt': 'Mulheres',
      'en': 'Women',
      'es': 'Mujer',
    },
    'vhvg5ui3': {
      'pt': 'Categorias de interesse',
      'en': 'Categories of interest',
      'es': 'Categorías de interés',
    },
    'xjks5w1i': {
      'pt': 'Locais favoritos',
      'en': 'Favorite places',
      'es': 'Lugares favoritos',
    },
    'rpvrb7g8': {
      'pt': 'Locais favoritos',
      'en': 'Favorite places',
      'es': 'Lugares favoritos',
    },
  },
  // UserProfileCard
  {
    'sj0jm84k': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'bgtodfew': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    'vcmr65vk': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'fpq7o58b': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    '9wtvlorb': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'nr07fosq': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    'vgh901zz': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
  },
  // List_H_Event
  {
    'bm0kgfne': {
      'pt': 'Agora',
      'en': 'Now',
      'es': 'Ahora',
    },
    'rkdm1mwn': {
      'pt': 'Finalizado',
      'en': 'Finished',
      'es': 'Finalizado',
    },
  },
  // NewComplaint
  {
    'ilp9a0qg': {
      'pt': 'Registrar Denuncia',
      'en': 'Register Report',
      'es': 'Informe de registro',
    },
    'eoleb59j': {
      'pt': 'Descreva o motivo da sua denuncia...',
      'en': 'Describe the reason for your report...',
      'es': 'Describe el motivo de tu informe...',
    },
    'axzgi1mb': {
      'pt': 'Denuciar',
      'en': 'Report',
      'es': 'Informe',
    },
    'xdc7ms6u': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    'is5337lh': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // NewHelpRequest
  {
    'ubeeuhyf': {
      'pt': 'Solicitar Ajuda',
      'en': 'Request Help',
      'es': 'Solicitar ayuda',
    },
    'gds9mm76': {
      'pt': 'Descreva o que esta acontecendo...',
      'en': 'Describe what is happening...',
      'es': 'Describe lo que está pasando...',
    },
    '6zk7fj5m': {
      'pt': 'Solicitar',
      'en': 'Request',
      'es': 'Pedido',
    },
    'mpw55ejx': {
      'pt': 'Campo obrigatório',
      'en': 'Required field',
      'es': 'Campo obligatorio',
    },
    '1q4gkpsz': {
      'pt': 'Please choose an option from the dropdown',
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor elija una opción del menú desplegable',
    },
  },
  // EventNewInvite
  {
    'rkkd7wks': {
      'pt': 'Convidar',
      'en': 'To invite',
      'es': 'Invitar',
    },
    '39dtgli9': {
      'pt': 'Buscar Usuário...',
      'en': 'Search User...',
      'es': 'Buscar usuario...',
    },
    'cxqhmh1k': {
      'pt': 'Convidado',
      'en': 'Guest',
      'es': 'Invitado',
    },
    '8q3ykz4g': {
      'pt': 'Convidar',
      'en': 'To invite',
      'es': 'Invitar',
    },
  },
  // userFavoritePlaces
  {
    'kwxdwxli': {
      'pt': 'Locais favoritos',
      'en': 'Favorite places',
      'es': 'Lugares favoritos',
    },
  },
  // userConfirmedEvents
  {
    'hail8e07': {
      'pt': 'Eventos Confirmados',
      'en': 'Confirmed Events',
      'es': 'Eventos confirmados',
    },
  },
  // NotLoggedUsers
  {
    'mga9qwuh': {
      'pt': 'Apenas para usuários conectados',
      'en': 'Only for logged in users',
      'es': 'Sólo para usuarios registrados',
    },
    'tx3dcfpr': {
      'pt': 'Login',
      'en': 'Login',
      'es': 'Acceso',
    },
  },
  // InactiveEvent
  {
    'y266i7wk': {
      'pt': 'Este evento esta inativo.',
      'en': 'This event is inactive.',
      'es': 'Este evento está inactivo.',
    },
    'k94h326c': {
      'pt': 'Solicitar Ajuda',
      'en': 'Request Help',
      'es': 'Solicitar ayuda',
    },
  },
  // InactivePlace
  {
    'ndu4pbt6': {
      'pt': 'Este local esta inativo.',
      'en': 'This location is inactive.',
      'es': 'Esta ubicación está inactiva.',
    },
    '9f710zco': {
      'pt': 'Solicitar Ajuda',
      'en': 'Request Help',
      'es': 'Solicitar ayuda',
    },
  },
  // NotificationInvite
  {
    'lm5fhm7d': {
      'pt': 'Você foi convidado',
      'en': 'You were invited',
      'es': 'fuiste invitado',
    },
  },
  // SearchPlaces
  {
    'oo024s9h': {
      'pt': 'Locais',
      'en': 'Locations',
      'es': 'Ubicaciones',
    },
    'pzaf6tm5': {
      'pt': 'Buscar Locais...',
      'en': 'Search Places...',
      'es': 'Buscar lugares...',
    },
    '4fidyl61': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // SearchEvents
  {
    'sxne3rbz': {
      'pt': 'Eventos',
      'en': 'Events',
      'es': 'Eventos',
    },
    '5x4jhpji': {
      'pt': 'Buscar Eventos...',
      'en': 'Search Events...',
      'es': 'Buscar eventos...',
    },
    'hzxjfeqt': {
      'pt': 'Evento Livre',
      'en': 'Free Event',
      'es': 'Evento gratuito',
    },
    'tojf5slc': {
      'pt': 'Confirmado',
      'en': 'Confirmed',
      'es': 'Confirmado',
    },
    '875xg0p8': {
      'pt': 'Vou',
      'en': 'I go',
      'es': 'Voy',
    },
    'd86cu2ct': {
      'pt': 'Evento começou',
      'en': 'Event started',
      'es': 'Evento iniciado',
    },
    'j36xgt9u': {
      'pt': 'Visitar',
      'en': 'Visit',
      'es': 'Visita',
    },
    'llcz19n1': {
      'pt': 'Evento Finalizado',
      'en': 'Event Finished',
      'es': 'Evento terminado',
    },
    'so4jn3aw': {
      'pt': 'Ver',
      'en': 'To see',
      'es': 'Para ver',
    },
  },
  // placeButtonsInfo
  {
    'ng4zx9dp': {
      'pt':
          'A Placed é um aplicativo com objetivo de conectar pessoas, em caso de problemas, entre em contato com o nosso suporte.',
      'en':
          'Placed is an application aimed at connecting people, in case of problems, contact our support.',
      'es':
          'Placed es una aplicación destinada a conectar personas, en caso de problemas contacta con nuestro soporte.',
    },
    'bgmwh587': {
      'pt': 'Registar Local',
      'en': 'Register Location',
      'es': 'Registrar Ubicación',
    },
    '5h9h5vh4': {
      'pt': 'Preciso de Ajuda',
      'en': 'Need help',
      'es': 'Necesito ayuda',
    },
    '5nyl9woj': {
      'pt': 'Denunciar Local',
      'en': 'Report Location',
      'es': 'Ubicación del informe',
    },
  },
  // UserProfileCard2
  {
    'o8xhye71': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'uq0tcvs2': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    '3dvdn55r': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'opg994kn': {
      'pt': 'Posts',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'jzv3hfwe': {
      'pt': 'Likes',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'dd928d9o': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'xwuztjl5': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    'ontcjfmw': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    '0yhdr6mo': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
  },
  // UserCardMin
  {
    '8w5tq6nn': {
      'pt': ' ',
      'en': '',
      'es': '',
    },
  },
  // UserProfileCard3
  {
    '0sxx7sor': {
      'pt': 'Posts',
      'en': 'Visits',
      'es': 'Visitas',
    },
    '4cyw8m39': {
      'pt': 'Likes',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'qjmfzl4c': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    '4czdckjr': {
      'pt': 'Posts',
      'en': 'Posts',
      'es': 'Publicaciones',
    },
    '49zah9jn': {
      'pt': 'Likes',
      'en': 'Likes',
      'es': 'Gustos',
    },
    '7l1rhp3l': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
  },
  // UserProfileCard4
  {
    '89wa2wnn': {
      'pt': 'Likes',
      'en': 'Visits',
      'es': 'Visitas',
    },
    '1f7793js': {
      'pt': 'Visitas',
      'en': 'Visits',
      'es': 'Visitas',
    },
    'wk9yw9bw': {
      'pt': 'Editar Perfil',
      'en': '',
      'es': '',
    },
    '7znb5lha': {
      'pt': 'Liked',
      'en': '',
      'es': '',
    },
    'f8seavym': {
      'pt': 'Like',
      'en': '',
      'es': '',
    },
    'cnoav7g6': {
      'pt': '12',
      'en': '',
      'es': '',
    },
    'e8eyw7nc': {
      'pt': '15k',
      'en': '',
      'es': '',
    },
    'rksakdri': {
      'pt': '122k',
      'en': '',
      'es': '',
    },
    'p08w78je': {
      'pt': 'Editar Perfil',
      'en': '',
      'es': '',
    },
  },
  // UserProfileMenu
  {
    'h4yt8mup': {
      'pt': 'Menu',
      'en': 'New Event',
      'es': 'Nuevo evento',
    },
    '27nz8hqx': {
      'pt': 'Editar Perfil',
      'en': '',
      'es': '',
    },
    '9a5owrkt': {
      'pt': 'Hello World',
      'en': '',
      'es': '',
    },
    'p44uilg2': {
      'pt': 'Hello World',
      'en': '',
      'es': '',
    },
  },
  // UserMenu
  {
    '3l917yp6': {
      'pt': 'Menu',
      'en': 'New Event',
      'es': 'Nuevo evento',
    },
    'rkpcykg1': {
      'pt': 'Cadastrar',
      'en': 'Register',
      'es': 'Registrar',
    },
    's1shit5y': {
      'pt': 'Cadastrar',
      'en': 'Register',
      'es': 'Registrar',
    },
    'b1gpd0cw': {
      'pt': 'Cadastrar',
      'en': 'Register',
      'es': 'Registrar',
    },
  },
  // List_H_Place2
  {
    '4elryqgf': {
      'pt': 'distancia',
      'en': '',
      'es': '',
    },
    '52deo56l': {
      'pt': '+15',
      'en': '',
      'es': '',
    },
    'yyyvcyol': {
      'pt': '4.1',
      'en': '',
      'es': '',
    },
    'qcyookp8': {
      'pt': '+15',
      'en': '',
      'es': '',
    },
  },
  // reviewEvent
  {
    's6w9tdpm': {
      'pt': 'Avalie sua visita',
      'en': 'Rate Your Trip',
      'es': 'Califica tu viaje',
    },
    'wi7l2gil': {
      'pt': 'Nos conte o que você achou desta visita!',
      'en': 'Let us know what you thought of the place below!',
      'es': '¡Cuéntanos qué te pareció el lugar a continuación!',
    },
    '1e7m75fu': {
      'pt': 'Como você avalia no geral?',
      'en': 'How would you rate it?',
      'es': '¿Cómo lo calificarías?',
    },
    'pmpl9aec': {
      'pt': 'Como foi sua expreriência no local?',
      'en': 'Please leave a description of the place...',
      'es': 'Por favor deja una descripción del lugar...',
    },
    'jfrh5ywh': {
      'pt': 'Enviar Avaliação',
      'en': 'Submit Review',
      'es': 'Enviar opinión',
    },
  },
  // UsarBtnLike
  {
    '4buwfx24': {
      'pt': 'Like',
      'en': '',
      'es': '',
    },
    '0mdexzzp': {
      'pt': 'Liked',
      'en': '',
      'es': '',
    },
  },
  // PlacedTopBar
  {
    'v5txx7ae': {
      'pt': 'placed',
      'en': '',
      'es': '',
    },
  },
  // UpdateLocation
  {
    'mzlcsr3z': {
      'pt': 'Distância',
      'en': '',
      'es': '',
    },
    'rit48z8l': {
      'pt': ' Km',
      'en': '',
      'es': '',
    },
    'pqythswy': {
      'pt': 'Selecione o endereço de busca',
      'en': '',
      'es': '',
    },
    'oran04ud': {
      'pt': 'Localização utilizada para busca:',
      'en': '',
      'es': '',
    },
    '09rsqy4y': {
      'pt': 'Atual',
      'en': '',
      'es': '',
    },
    'ezov4qqa': {
      'pt': 'Selecionada',
      'en': '',
      'es': '',
    },
    '8uxgqo1t': {
      'pt': 'Cancelar',
      'en': '',
      'es': '',
    },
  },
  // CardPlaceSubscription
  {
    'zyk2gk12': {
      'pt': 'Cannabis in Thailand',
      'en': '',
      'es': '',
    },
    'k0akclac': {
      'pt': '16 friends played',
      'en': '',
      'es': '',
    },
    'l93q97v7': {
      'pt': 'Inativo',
      'en': '',
      'es': '',
    },
  },
  // UserPage02
  {
    '8y194t76': {
      'pt': 'Postagens',
      'en': '',
      'es': '',
    },
    'd7eex4sk': {
      'pt': 'Seguidores',
      'en': '',
      'es': '',
    },
    '5b8qqcgq': {
      'pt': '145',
      'en': '',
      'es': '',
    },
    'm6c5urad': {
      'pt': 'Visitas',
      'en': '',
      'es': '',
    },
    '6i2p826w': {
      'pt': 'Seguir',
      'en': '',
      'es': '',
    },
  },
  // VisitCard
  {
    'iv5xt7pw': {
      'pt': 'No-Code Platform Design',
      'en': '',
      'es': '',
    },
    'g151xjjr': {
      'pt': '30%',
      'en': '',
      'es': '',
    },
  },
  // UserCardBanner
  {
    'dmmam56t': {
      'pt': '25',
      'en': '',
      'es': '',
    },
    'lw1eh96f': {
      'pt': 'Music',
      'en': '',
      'es': '',
    },
    'ctuknayq': {
      'pt': 'Art',
      'en': '',
      'es': '',
    },
    'i36yl60b': {
      'pt': 'Nature',
      'en': '',
      'es': '',
    },
    'hgupydz4': {
      'pt': 'Buscando novas amizades',
      'en': '',
      'es': '',
    },
    'j05r571q': {
      'pt': 'Buscando relacionamento',
      'en': '',
      'es': '',
    },
    '8m9og5mr': {
      'pt': 'Ver Perfil',
      'en': '',
      'es': '',
    },
    'dlyhq448': {
      'pt': 'Conectado',
      'en': '',
      'es': '',
    },
    'sj4z1vgv': {
      'pt': '+ Conectar',
      'en': '',
      'es': '',
    },
    'k7zjk321': {
      'pt': 'Seguindo',
      'en': '',
      'es': '',
    },
    'f66l6cog': {
      'pt': '+ Seguir',
      'en': '',
      'es': '',
    },
  },
  // UserObjects
  {
    'ked9fokh': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'yhztej14': {
      'pt': 'Videos',
      'en': '',
      'es': '',
    },
    '3s0uf3ge': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '755cl2lo': {
      'pt': 'Avaliações',
      'en': '',
      'es': '',
    },
    'bs99ixhs': {
      'pt': 'Visitas',
      'en': '',
      'es': '',
    },
  },
  // UserVisitCard
  {
    '57m0miqy': {
      'pt': 'Local',
      'en': '',
      'es': '',
    },
    '84i9bsz8': {
      'pt': 'Evento',
      'en': '',
      'es': '',
    },
    'aawt50gw': {
      'pt': 'Sem Local ou evento',
      'en': '',
      'es': '',
    },
  },
  // PlaceObjects
  {
    '6dag5nt0': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ih7whffx': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '492gu6tp': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'zrm7j4b6': {
      'pt': 'Tab View 3',
      'en': '',
      'es': '',
    },
    'rb4p5ukm': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // PlacePage01
  {
    '5xrn7m9y': {
      'pt': '5.0',
      'en': '',
      'es': '',
    },
    'rf0ti1aw': {
      'pt': 'Belo Horizonte',
      'en': '',
      'es': '',
    },
  },
  // RelationshipComp
  {
    'g864f1b8': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'kacp44ly': {
      'pt': '',
      'en': '',
      'es': '',
    },
    't9ij6lkc': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
  // UserTabsPage
  {
    'ue00i5b5': {
      'pt': 'Example 1',
      'en': '',
      'es': '',
    },
    'a929xvc8': {
      'pt': 'Example 2',
      'en': '',
      'es': '',
    },
    'gdcbmq9z': {
      'pt': 'Example 3',
      'en': '',
      'es': '',
    },
    '7v2guztr': {
      'pt': 'Tab View 3',
      'en': '',
      'es': '',
    },
  },
  // user_ListSmall
  {
    'm2v0a8as': {
      'pt': 'name@domainname.com',
      'en': '',
      'es': '',
    },
    'emypsd3d': {
      'pt': 'ME',
      'en': '',
      'es': '',
    },
  },
  // deleteDialog
  {
    'z8s1z4mx': {
      'pt': 'Options',
      'en': '',
      'es': '',
    },
    'zihno9b1': {
      'pt': 'Invite Users',
      'en': '',
      'es': '',
    },
    '47yp849g': {
      'pt': 'Delete Chat',
      'en': '',
      'es': '',
    },
    'tlqgp6dz': {
      'pt': 'Confirm Delete',
      'en': '',
      'es': '',
    },
    'azdmiaor': {
      'pt': 'You can\'t undo this action.',
      'en': '',
      'es': '',
    },
    'czpdkf9m': {
      'pt': 'Delete',
      'en': '',
      'es': '',
    },
  },
  // DashNewPost
  {
    'hdnfhb0q': {
      'pt': 'Nova Postagem',
      'en': '',
      'es': '',
    },
    '58kg8dr3': {
      'pt': 'Camera',
      'en': '',
      'es': '',
    },
    '10c8qlsv': {
      'pt': 'Foto',
      'en': '',
      'es': '',
    },
    'rn46kx6h': {
      'pt': 'Video',
      'en': '',
      'es': '',
    },
    '1v5cqd98': {
      'pt': 'Descrição...',
      'en': '',
      'es': '',
    },
    'pogvs52a': {
      'pt': 'Enviar',
      'en': '',
      'es': '',
    },
    'ik0abmyd': {
      'pt': 'Field is required',
      'en': '',
      'es': '',
    },
    'muxivuxy': {
      'pt': 'Please choose an option from the dropdown',
      'en': '',
      'es': '',
    },
  },
  // DashHomepage
  {
    '1hyubyjb': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'igpofn7k': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'rgph31wx': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ybqz7lwc': {
      'pt': '',
      'en': 'We would like your permission to send you notifications.',
      'es': 'Nos gustaría su permiso para enviarle notificaciones.',
    },
  },
  // DashChatPage
  {
    'z6az77mf': {
      'pt': 'placed',
      'en': '',
      'es': '',
    },
    'xmmfbh57': {
      'pt': 'Buscar conexões',
      'en': '',
      'es': '',
    },
    'f1pmnq5k': {
      'pt': 'Conversas',
      'en': '',
      'es': '',
    },
  },
  // DashSeachPage
  {
    'vny0o0tx': {
      'pt': 'Locais',
      'en': '',
      'es': '',
    },
    'frlc210s': {
      'pt': 'Eventos',
      'en': '',
      'es': '',
    },
    'w1ojotpv': {
      'pt': 'Produtos',
      'en': '',
      'es': '',
    },
    'z9x42nru': {
      'pt': 'Produtos',
      'en': '',
      'es': '',
    },
    'defdlpu3': {
      'pt': 'Buscar Produtos...',
      'en': '',
      'es': '',
    },
  },
  // DashProfile
  {
    'vkzg83zn': {
      'pt': 'Conta',
      'en': '',
      'es': '',
    },
    'ajpqpzyb': {
      'pt': 'Editar Perfil',
      'en': '',
      'es': '',
    },
    'gxtkgn2q': {
      'pt': 'Meus Eventos',
      'en': '',
      'es': '',
    },
    'sjy3xltt': {
      'pt': 'Minhas Visitas',
      'en': '',
      'es': '',
    },
    '8wqlzgg1': {
      'pt': 'Assinaturas',
      'en': '',
      'es': '',
    },
    '4fw42xif': {
      'pt': 'General',
      'en': '',
      'es': '',
    },
    'sf7ukw64': {
      'pt': 'Ajuda',
      'en': '',
      'es': '',
    },
    'nm8c8vqi': {
      'pt': 'Termos de Uso',
      'en': '',
      'es': '',
    },
    'otj71cbr': {
      'pt': 'Convidar Amigos',
      'en': '',
      'es': '',
    },
    'jn3s2807': {
      'pt': 'Desconectar da conta',
      'en': '',
      'es': '',
    },
  },
  // PlaceDashboard
  {
    '7cpsqyc3': {
      'pt': '20 Visitantes',
      'en': '',
      'es': '',
    },
    'xy658cdb': {
      'pt': 'Avaliações',
      'en': '',
      'es': '',
    },
  },
  // DashHomePage
  {
    'zt23ke3p': {
      'pt': 'Descubra seu\n',
      'en': '',
      'es': '',
    },
    'bzbmlzj4': {
      'pt': 'Proximo destino',
      'en': '',
      'es': '',
    },
    'g7ta2prt': {
      'pt': 'Busque por restaurantes, eventos...',
      'en': '',
      'es': '',
    },
    '6o3rsup8': {
      'pt': 'Usuários proxímos',
      'en': '',
      'es': '',
    },
    '74ob8op3': {
      'pt': 'Todos',
      'en': '',
      'es': '',
    },
    'uyy1uwwj': {
      'pt': 'Realize o login para visualizar usuários próximos',
      'en': '',
      'es': '',
    },
    '4xvs31io': {
      'pt': 'Locais proxímos',
      'en': '',
      'es': '',
    },
    'umr0b8py': {
      'pt': 'Eventos proxímos',
      'en': '',
      'es': '',
    },
  },
  // HaveAcountText
  {
    'vwcgfu5v': {
      'pt': 'Já possui conta? ',
      'en': '',
      'es': '',
    },
    'iamianjj': {
      'pt': ' Log In',
      'en': '',
      'es': '',
    },
  },
  // NotHaveAcountText
  {
    'q5y8mq2e': {
      'pt': 'Não possui conta? ',
      'en': '',
      'es': '',
    },
    'yvrao9f8': {
      'pt': 'Cadastrar',
      'en': '',
      'es': '',
    },
  },
  // PlaceCardBanner
  {
    'ydh3aqb6': {
      'pt': 'Music',
      'en': '',
      'es': '',
    },
    'j2vc80ki': {
      'pt': 'Art',
      'en': '',
      'es': '',
    },
    'fy89cd9y': {
      'pt': 'Nature',
      'en': '',
      'es': '',
    },
    'd2dtfr6v': {
      'pt': 'Ver Local',
      'en': '',
      'es': '',
    },
    'zk2kak14': {
      'pt': 'Visitando',
      'en': '',
      'es': '',
    },
    'g19kyxew': {
      'pt': 'Visitar',
      'en': '',
      'es': '',
    },
  },
  // PlaceTabDescription
  {
    '5xe46j8a': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'rlpmv9g0': {
      'pt': 'Avaliações',
      'en': '',
      'es': '',
    },
    'amwgmnm0': {
      'pt': 'Localização',
      'en': '',
      'es': '',
    },
    '2deaja31': {
      'pt': 'Descrição',
      'en': '',
      'es': '',
    },
    'n2iplf80': {
      'pt': 'Avaliações',
      'en': '',
      'es': '',
    },
    'oay2qp9b': {
      'pt': 'Localização',
      'en': '',
      'es': '',
    },
  },
  // VisitProfileCard
  {
    '9u31sh5j': {
      'pt': 'null',
      'en': '',
      'es': '',
    },
  },
  // Miscellaneous
  {
    '2oxg74uf': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ckj9cuzr': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '0ukx4neo': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'j572ag2k': {
      'pt': '',
      'en': 'We would like your permission to send you notifications.',
      'es': 'Nos gustaría su permiso para enviarle notificaciones.',
    },
    'amtdb0jv': {
      'pt':
          'In order to check your position, this app requires permission to access the location.',
      'en':
          'In order to check your position, this app requires permission to access the location.',
      'es':
          'Para verificar su posición, esta aplicación requiere permiso para acceder a la ubicación.',
    },
    '5ojmdfi6': {
      'pt': 'Gostariamos de sua permissão para enviar notificações.',
      'en': 'We would like your permission to send you notifications.',
      'es': 'Nos gustaría su permiso para enviarle notificaciones.',
    },
    '7vox0u6p': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'wjp6nfws': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'x464ovqv': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'so1jehnb': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ap8xqtio': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'sm0yuc1k': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6schr0qb': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'xjlonltz': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'yq7ncace': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '4gj02nho': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'vfv85j3f': {
      'pt': '',
      'en': 'We would like your permission to send you notifications.',
      'es': 'Nos gustaría su permiso para enviarle notificaciones.',
    },
    'k5wncubw': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'rqorca08': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'p5cxausp': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ztvf13ws': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'vilwkr3z': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '4bheiz4s': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'fs00xkcm': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'kz3hkwsn': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '7gxs4nxl': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'npg57ceu': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'mpslz4gg': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'ney84kso': {
      'pt': '',
      'en': '',
      'es': '',
    },
    '6z75ew3u': {
      'pt': '',
      'en': '',
      'es': '',
    },
    'hpy6pe7m': {
      'pt': '',
      'en': '',
      'es': '',
    },
  },
].reduce((a, b) => a..addAll(b));
