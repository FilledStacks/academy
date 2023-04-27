import 'package:filledstacks_academy/app/app.logger.dart';
import 'package:filledstacks_academy/models/models.dart';

import 'app_api.dart';

const kFakeCourses = [
  {
    "id": "flutter-web",
    "readableId": "flutter-web",
    "title": "Master Flutter on the Web",
    "modules": [
      {
        "id": "prerequisites",
        "title": "Prerequisites",
        "chapters": [
          {
            "id": "system-requirements",
            "title": "System Requirements",
            "description":
                "An overview of what you need to have installed, the versions we're working with at the time of creating this course.",
            "durationInSeconds": 300
          },
          {
            "id": "knowledge-requirements",
            "title": "Knowledge Requirements",
            "description":
                "What you need to know to get the most out of this course",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "intro-to-flutter-web",
        "title": "Intro to Flutter Web",
        "chapters": [
          {
            "id": "html-vs-canvas",
            "title": "HTML vs Canvas",
            "description":
                "A clear breakdown of the difference between a traditional Javascript Framework and a Flutter web app.",
            "durationInSeconds": 300
          },
          {
            "id": "seo-vs-web-app",
            "title": "SEO vs Web App",
            "description":
                "The difference between a website made for SEO and a Web application (What you make with Flutter)",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "how-we-build-the-app",
        "title": "How we'll build our web app",
        "chapters": [
          {
            "id": "intro-to-stacked",
            "title": "Intro to Stacked",
            "description":
                "An overview of Stacked, what it is, what it's not and why we're using it.",
            "durationInSeconds": 300
          },
          {
            "id": "intro-to-stacked-state-management",
            "title": "State management in Stacked",
            "description":
                "An overview of how state management works when using the Stacked Framework",
            "durationInSeconds": 300
          },
          {
            "id": "intro-to-stacked-navigation",
            "title": "Navigation in Stacked",
            "description":
                "An overview of Stacked navigation basics. Going to a new view, passing paramters, waiting on a view to return.",
            "durationInSeconds": 300
          },
          {
            "id": "intro-to-stacked-services",
            "title": "Intro to Stacked Services",
            "description":
                "An overview of the services that come with Stacked Services that serve as helpers for specific types of functionality.",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "getting-started",
        "title": "Getting Started",
        "chapters": [
          {
            "id": "create-project",
            "title": "Create the project",
            "description": "Create the starting project with Stacked CLI",
            "durationInSeconds": 300
          },
          {
            "id": "stacked-structure-overview",
            "title": "Stacked structure overview",
            "description":
                "A look at the files in stacked, the folder structure and where specific files should go",
            "durationInSeconds": 300
          },
          {
            "id": "build-landing-page-ui",
            "title": "Build a Landing Page for Desktop",
            "description":
                "A step-by-step guide of building a landing page in Flutter using Stacked",
            "durationInSeconds": 300
          },
          {
            "id": "refactor-landing-widgets",
            "title": "Refactor landing widgets for sharing",
            "description":
                "Create widgets for the UI that will be shared between the desktop and mobile layouts",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "responsive-ui-deep-dive",
        "title": "Responsive UI Deep Dive",
        "chapters": [
          {
            "id": "how-responsive-builder-works",
            "title":
                "How Responsive Builder Works - Intro to Layout based responsiveness ",
            "description":
                "An overview of how responsive builder package works and how to get the most out of the package.",
            "durationInSeconds": 300
          },
          {
            "id": "build-mobile-landing-ui",
            "title": "Build the Mobile Landing UI",
            "description":
                "Using the refactored widgets from the Landing Desktop View to build the Mobile UI",
            "durationInSeconds": 300
          },
          {
            "id": "widget-level-responsiveness",
            "title": "Widget Level Responsiveness",
            "description":
                "An overview of what widget level responsiveness means, when to use it and how to implement it ",
            "durationInSeconds": 300
          },
          {
            "id": "alternatives-to-layout-responsive-design",
            "title": "Alternatives to Layout based Responsive Design",
            "description":
                "Understand the different types of responsive design, how to apply each one and how to combine them for the results you want.",
            "durationInSeconds": 300
          },
          {
            "id": "keeping-layout-and-scaling-widgets",
            "title": "Keeping the same layouts and scaling widgets",
            "description": "An example of how responsive UI works when you",
            "durationInSeconds": 300
          },
          {
            "id": "scaling-only-solution",
            "title": "Scale UI based on screen size",
            "description":
                "A guide to building UI based on the screen size to ensure it always looks the same everywhere",
            "durationInSeconds": 300
          },
          {
            "id": "decide-on-responsive-building-type",
            "title": "Make a Responsive UI Descision",
            "description":
                "A guide to use for making a responsive building decision and when to choose either or a combination of responsive UI types",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "route-management",
        "title": "Route Management",
        "chapters": [
          {
            "id": "nested-layouts",
            "title": "Nested Layout with Toolbar and Footers",
            "description":
                "How to setup nested layouts to have a permanent header navbar and footer in the Flutter web app",
            "durationInSeconds": 300
          },
          {
            "id": "custom-urls-and-dynamic",
            "title": "Custom Urls and Dyamic Path Parameters",
            "description":
                "How to set a custom url per view and provide dynamic path / slug segments",
            "durationInSeconds": 300
          },
          {
            "id": "query-parameters",
            "title": "URL Query Parameters",
            "description": "How to setup Query Parameters for your URL",
            "durationInSeconds": 300
          },
          {
            "id": "direct-url-navigation",
            "title": "Direct URL Navigation",
            "description":
                "How to handle direct navigation for views that require additional Data",
            "durationInSeconds": 300
          },
          {
            "id": "404-handling",
            "title": "404 Route handing",
            "description":
                "A guide on how to setup and handle 404's for paths and failed views",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "authentication",
        "title": "Authentication",
        "chapters": [
          {
            "id": "firebase-auth-setup",
            "title": "Firebase Authentication Setup",
            "description":
                "Setup firebase authentication and perform google sign in",
            "durationInSeconds": 300
          },
          {
            "id": "sign-in-logout-toolbar",
            "title": "Build a sign up and logout toolbar",
            "description":
                "Create a UI for sign in and logout dropdown that's always available",
            "durationInSeconds": 300
          },
          {
            "id": "route-guarding",
            "title": "Route Guarding in Stacked",
            "description":
                "An explanation of Route Guarding and an example of unauthenticated Route Guarding",
            "durationInSeconds": 300
          },
          {
            "id": "direct-url-navigation",
            "title": "Direct URL Navigation",
            "description":
                "How to handle direct navigation for views that require additional Data",
            "durationInSeconds": 300
          },
          {
            "id": "route-guarding",
            "title": "Route Guarding",
            "description":
                "An overview of Route Guarding in Stacked to manage access to certain paths",
            "durationInSeconds": 300
          },
          {
            "id": "404-handling",
            "title": "404 Route handing",
            "description":
                "A guide on how to setup and handle 404's for paths and failed views",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "api-integration",
        "title": "Api Integration",
        "chapters": [
          {
            "id": "api-service",
            "title": "Build an Api Service",
            "description": "Building an Api Service to handle all requests",
            "durationInSeconds": 300
          },
          {
            "id": "universal-status-code-handling",
            "title": "Universal Status Code Handling",
            "description":
                "A guide on how to handle status code for all requests going through the service",
            "durationInSeconds": 300
          },
          {
            "id": "auth-in-headers",
            "title": "Authentication in headers",
            "description":
                "An overview of how to pass authentication to requests",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "form-funtionality",
        "title": "Form Functionality",
        "chapters": [
          {
            "id": "overview-of-stacked-forms",
            "title": "Overview of Stacked Forms",
            "description":
                "An explanation of Stacked forms, what it provides and how to use it",
            "durationInSeconds": 300
          },
          {
            "id": "setup-a-form",
            "title": "Setup a Form",
            "description": "A tutorial covering how to setup a Form in Stacked",
            "durationInSeconds": 300
          },
          {
            "id": "form-validation",
            "title": "Form Validation",
            "description": "A guide to implementing form validation",
            "durationInSeconds": 300
          },
          {
            "id": "initial-values",
            "title": "Setting initial values on a Form",
            "description": "How to set initial values on a form",
            "durationInSeconds": 300
          },
          {
            "id": "submit-a-form",
            "title": "Use Form Data when Complete",
            "description": "How to access the form data in the ViewModel",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "production-things",
        "title": "Production Things",
        "chapters": [
          {
            "id": "remote-logging-setup",
            "title": "Remote Logging Setup",
            "description":
                "Setting up remote logging to trace production usage of the app",
            "durationInSeconds": 300
          },
          {
            "id": "analytics-setup",
            "title": "Analytics Setup",
            "description": "Setup analytics for your website",
            "durationInSeconds": 300
          },
          {
            "id": "add-analytics-to-app",
            "title": "Add Analytics throughout the app",
            "description": "A guide to implementing form validation",
            "durationInSeconds": 300
          }
        ]
      },
      {
        "id": "browser-specifics",
        "title": "Browser Specifics",
        "chapters": [
          {
            "id": "flutter-to-javascript",
            "title": "How to communicate with Javascript through Flutter",
            "description":
                "An overview of how to communicate with Javascript from Flutter",
            "durationInSeconds": 300
          },
          {
            "id": "example-flutter-to-javascript",
            "title": "Example Flutter to Javascript",
            "description":
                "A step-by-step guide to communicate with Javascript through Flutter",
            "durationInSeconds": 300
          },
          {
            "id": "native-interaction-service",
            "title": "Build a Native Interaction Service",
            "description":
                "Creating a native interaction service to communicate with Javascript from ViewModels and Services.",
            "durationInSeconds": 300
          }
        ]
      }
    ]
  }
];

class FakeApi implements AppApi {
  final log = getLogger('FakeApi');

  @override
  Future<List<Course>> getCourses() async {
    log.v('-FAKE API In USE-');
    await Future.delayed(const Duration(seconds: 1));
    return [Course.fromJson(kFakeCourses[0])];
  }

  @override
  Future<Course> getCourse({required String id}) async {
    log.v('-FAKE API IN USE-');
    await Future.delayed(const Duration(seconds: 1));
    return Course.fromJson(kFakeCourses[0]);
  }
}
