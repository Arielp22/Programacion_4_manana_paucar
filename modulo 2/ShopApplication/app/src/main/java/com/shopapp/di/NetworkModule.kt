package com.shopapp.di

import com.shopapp.BuildConfig
import com.shopapp.data.local.TokenDataStore
import com.shopapp.data.remote.api.AuthApi
import com.shopapp.data.remote.api.CategoryApi
import com.shopapp.data.remote.api.OrderApi
import com.shopapp.data.remote.api.ProductApi
import com.shopapp.data.remote.api.UserApi
import com.shopapp.data.remote.interceptor.AuthInterceptor
import com.shopapp.data.remote.interceptor.BearerTokenInterceptor
import dagger.Module
import dagger.Provides
import dagger.hilt.InstallIn
import dagger.hilt.components.SingletonComponent
import okhttp3.OkHttpClient
import okhttp3.logging.HttpLoggingInterceptor
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import java.util.concurrent.TimeUnit
import javax.inject.Singleton

@Module
@InstallIn(SingletonComponent::class)
object NetworkModule {

    @Provides
    @Singleton
    fun provideLoggingInterceptor(): HttpLoggingInterceptor {
        return HttpLoggingInterceptor().apply {
            level = HttpLoggingInterceptor.Level.BODY
        }
    }

    @Provides
    @Singleton
    fun provideOkHttpClient(
        tokenDataStore: TokenDataStore,
        authInterceptor: AuthInterceptor,
        logging: HttpLoggingInterceptor,
    ): OkHttpClient {

        return OkHttpClient.Builder()

            // Renovar token automáticamente
            .authenticator(authInterceptor)

            // Agregar Authorization: Bearer ...
            .addInterceptor(
                BearerTokenInterceptor(tokenDataStore)
            )

            // Logs HTTP
            .addInterceptor(logging)

            // Timeouts ampliados para envío masivo
            .connectTimeout(60, TimeUnit.SECONDS)
            .readTimeout(180, TimeUnit.SECONDS)
            .writeTimeout(180, TimeUnit.SECONDS)

            // Evitar corte por conexiones inactivas
            .callTimeout(240, TimeUnit.SECONDS)

            .retryOnConnectionFailure(true)

            .build()
    }

    @Provides
    @Singleton
    fun provideRetrofit(
        client: OkHttpClient,
    ): Retrofit {

        return Retrofit.Builder()
            .baseUrl(BuildConfig.API_BASE_URL)
            .client(client)
            .addConverterFactory(
                GsonConverterFactory.create()
            )
            .build()
    }

    @Provides
    @Singleton
    fun provideAuthApi(
        retrofit: Retrofit,
    ): AuthApi =
        retrofit.create(AuthApi::class.java)

    @Provides
    @Singleton
    fun provideCategoryApi(
        retrofit: Retrofit,
    ): CategoryApi =
        retrofit.create(CategoryApi::class.java)

    @Provides
    @Singleton
    fun provideProductApi(
        retrofit: Retrofit,
    ): ProductApi =
        retrofit.create(ProductApi::class.java)

    @Provides
    @Singleton
    fun provideOrderApi(
        retrofit: Retrofit,
    ): OrderApi =
        retrofit.create(OrderApi::class.java)

    @Provides
    @Singleton
    fun provideUserApi(
        retrofit: Retrofit,
    ): UserApi =
        retrofit.create(UserApi::class.java)
}