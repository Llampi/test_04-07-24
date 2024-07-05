# Usar la imagen oficial de Ruby desde Docker Hub
FROM ruby:3.0

# Establecer el directorio de trabajo en el contenedor
WORKDIR /usr/src/app

# Copiar el Gemfile y Gemfile.lock al contenedor
COPY Gemfile* ./

# Instalar bundler
RUN gem install bundler

# Instalar las dependencias
RUN bundle install

# Copiar el resto del código de la aplicación al contenedor
COPY . .

# Establecer el directorio de trabajo a docs
WORKDIR /usr/src/app/docs

# Exponer el puerto 4000 para Jekyll
EXPOSE 4000

# Ejecutar el servidor Jekyll
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
