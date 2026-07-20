create table Endereco(
    id_Endereco INT PRIMARY KEYAUTO_INCREMET,
    cep VARCHAR (50) NOT NULL,
    logradouro VARCHAR (50) NOT NULL,
    numero VARCHAR (50),
    bairro VARCHAR (50), 
    
);

create table PessoaFisica (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    id_endereco INT NOT NULL,

    FOREIGN KEY (id_endereco)
        REFERENCES Endereco(id_endereco)
);

create table Paciente (
    id_paciente SERIAL PRIMARY KEY,
    id_pessoa INT NOT NULL UNIQUE,

    FOREIGN KEY (id_pessoa)
        REFERENCES PessoaFisica(id_pessoa)
);

create table Medico (
    id_medico SERIAL PRIMARY KEY,
    id_pessoa INT NOT NULL UNIQUE,
    crm VARCHAR(20) UNIQUE NOT NULL,

    FOREIGN KEY (id_pessoa)
        REFERENCES PessoaFisica(id_pessoa)
);

create table Consulta (
    id_consulta SERIAL PRIMARY KEY,
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    data DATE NOT NULL,
    horario TIME NOT NULL,
    enfermidade VARCHAR(200),

    FOREIGN KEY (id_paciente)
        REFERENCES Paciente(id_paciente),

    FOREIGN KEY (id_medico)
        REFERENCES Medico(id_medico)
);
