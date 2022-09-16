# Notes

This file captures "work in progress" notes.


## Devoxx BE 2022

- Q: AntMatchers? Mutliple filter chains?
- Q: csrf filters, how often does it regenerate a token?
- Notice: devtools keeps sessions alive across restarts

---

## Devoxx FR 2022

### Summary

0. Intro / me
1. Simple demo: how to _use_ Spring Security (one app, two endpoints, secure
   one, show name of the principal)
2. A bit of theory:
  - Authentication
  - Principal
  - Authorities
  - SecurityContext
3. Filters
  - Spring security general Filter architecture
    - Servlet filters
    - Spring filters
    - Spring security filters 
    - Breakpoint in FilterChainProxy
    - Example filter: SecurityFilterInterceptor or AuthorizationFilter
  - Let's write a filter
    - Let's write a filter! E.g., require a specific header or kill the request
    - Write a custom Authentication in the filter directly and shove it in the
      SecurityContextHolder
    - Transform the filter into an AuthenticationFilter
4. AuthenticationManager
  - AuthenticationManager and specifically ProviderManager
  - Example with auth overloading, e.g. "GeoIP" or "Weather" or whatev's
  - Also show the event handling with ProviderManager
  - Federated identity?
5. Configurers - find your way around it
  - Custom Configurer
6. Spring Boot autoconfigurer

---

## Reference

- [Spring Security Architecture](https://spring.io/guides/topicals/spring-security-architecture)

### Spring Security docs

- [Servlet architecture](https://docs.spring.io/spring-security/reference/servlet/architecture.html)
- [Authentication architecture](https://docs.spring.io/spring-security/reference/servlet/authentication/architecture.html)

---

## Parking lot / ideas

### Securing an application vs writing a security-driven app

It's a different beast - guides may be enough for the first case, maybe not so
for the second.

