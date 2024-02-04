use std::net::TcpListener;

use zero2prod::run;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    let port = 8000;
    let listener = TcpListener::bind(format!("127.0.0.1:{}", port))
        .unwrap_or_else(|_| panic!("Failed to bind port: {}", port));

    run(listener)?.await
}
