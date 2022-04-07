# Notes

This file captures "work in progress" notes.


## Summary

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
    - Move on to AbstractAuthenticationFilter 
    - Write a custom Authentication in the filter directly and shove it in the
      SecurityContextHolder
4. AuthenticationManager
  - AuthenticationManager and specifically ProviderManager
  - Example with auth overloading, e.g. "GeoIP" or "Weather" or whatev's
  - Also show the event handling with ProviderManager
  - Federated identity?
5. Configurers - find your way around it
  - OAuth2 Login configurer? SamlLoginConfigurer?
  - Fix the SAML bug :D
6. Spring Boot autoconfigurer




## Reference

- [Spring Security Architecture](https://spring.io/guides/topicals/spring-security-architecture)

### Spring Security docs

- [Servlet architecture](https://docs.spring.io/spring-security/reference/servlet/architecture.html)
- [Authentication architecture](https://docs.spring.io/spring-security/reference/servlet/authentication/architecture.html)



## Things to explore / try

- Devoxx template?
- SecurityFilterInterceptor or AuthorizationFilter for example purposes
- AbstractAuthenticationFilter, how to use it?
- ProviderManager, interesting use-cases
- Kotlin DSL



## Parking lot / ideas

### Securing an application vs writing a security-driven app

It's a different beast - guides may be enough for the first case, maybe not so
for the second.

### Misc topics

- Spring Boot and Spring Sec
- Spring Sec WITHOUT Boot
- Servlet apps vs Reactive Apps
  - Note: no SAML in reactive!
