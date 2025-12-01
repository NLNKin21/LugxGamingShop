package com.lugx.gamingHouse.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.lugx.gamingHouse.services.UserService;

@Configuration
@EnableMethodSecurity(securedEnabled = true)
public class securiryConfiguration {

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    // @Bean
    // public UserDetailsService userDetailsService(UserService userService) {
    //     return new CustomUserDetailsService(userService);
    // }

    // @Bean
    // public DaoAuthenticationProvider authProvider(
    //         PasswordEncoder passwordEncoder,
    //         UserDetailsService userDetailsService) {
    //     DaoAuthenticationProvider authProvider = new DaoAuthenticationProvider();
    //     authProvider.setUserDetailsService(userDetailsService);
    //     authProvider.setPasswordEncoder(passwordEncoder);
    //     authProvider.setHideUserNotFoundExceptions(false);
    //     return authProvider;
    // }

    // @Bean
    // public AuthenticationSuccessHandler customSuccessHandler() {
    //     return new CustomSuccessHandler();
    // }

    // @Bean
    // public SpringSessionRememberMeServices rememberMeServices() {
    //     SpringSessionRememberMeServices rememberMeServices = new SpringSessionRememberMeServices();

    //     // optionally customize
    //     rememberMeServices.setAlwaysRemember(true);
    //     return rememberMeServices;
    // }

    // @Bean
    // SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    //     http
    //             .authorizeHttpRequests(authorize -> authorize
    //                     .dispatcherTypeMatchers(DispatcherType.FORWARD, DispatcherType.INCLUDE)
    //                     .permitAll()
    //                     .requestMatchers("/", "/login", "/client/**", "/css/**", "/product/**", "/register/**",
    //                             "/js/**", "/images/**")
    //                     .permitAll()

    //                     .requestMatchers("/admin/**").hasRole("ADMIN")
    //                     .anyRequest().authenticated())

    //             .sessionManagement((sessionManagement) -> sessionManagement
    //                     .sessionCreationPolicy(SessionCreationPolicy.ALWAYS)
    //                     .invalidSessionUrl("/logout?expired")
    //                     .maximumSessions(1)
    //                     .maxSessionsPreventsLogin(false))
    //             .logout(logout -> logout.deleteCookies("JSESSIONID").invalidateHttpSession(true))

    //             .rememberMe(r -> r.rememberMeServices(rememberMeServices()))
    //             .formLogin(formLogin -> formLogin
    //                     .loginPage("/login")
    //                     .failureUrl("/login?error")
    //                     .successHandler(customSuccessHandler())
    //                     .permitAll())
    //             .exceptionHandling(ex -> ex.accessDeniedPage("/access-deny"));
    //     return http.build();
    // }
}

