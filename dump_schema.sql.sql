CREATE TABLE sqlite_sequence(name,seq);

CREATE TABLE TB_JOGO (
    ID_Jogo INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome_Jogo TEXT NOT NULL UNIQUE,
    Plataforma TEXT NOT NULL
        CHECK (Plataforma IN ('PC', 'PlayStation', 'Xbox', 'Nintendo')),
    Preco REAL NOT NULL
        CHECK (Preco > 0),
    Estoque INTEGER DEFAULT 10
        CHECK (Estoque >= 0)
);

CREATE TABLE TB_VENDA (
    ID_Venda INTEGER PRIMARY KEY AUTOINCREMENT,
    Nome_Cliente TEXT NOT NULL,
    Quantidade INTEGER NOT NULL
        CHECK (Quantidade > 0),
    Forma_Pagamento TEXT DEFAULT 'Pix'
        CHECK (Forma_Pagamento IN ('Pix', 'Cartao', 'Dinheiro')),
    ID_Jogo INTEGER NOT NULL,

    FOREIGN KEY (ID_Jogo)
    REFERENCES TB_JOGO(ID_Jogo)
    ON DELETE CASCADE
);
