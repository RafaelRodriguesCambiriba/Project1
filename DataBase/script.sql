create table "user"
(
    id           serial
        constraint user_pkey
            primary key,
    name         varchar(25) not null,
    login        varchar(25) not null,
    password     varchar(20) not null,
    fixed_salary double precision,
    login_share  varchar(25)
);

alter table "user"
    owner to postgres;

create table checking_account
(
    id            serial
        constraint checking_account_pkey
            primary key,
    description   varchar(25)       not null,
    value         double precision  not null,
    date          date              not null,
    type          integer           not null,
    id_user       integer default 0 not null
        constraint checking_account_id_auser_fkey
            references "user",
    id_user_share integer
        constraint checking_account_id_auser_share_fkey
            references "user"
);

alter table checking_account
    owner to postgres;

create table share_checking_account
(
    id                  serial
        constraint share_transaction_pkey
            primary key,
    date                date,
    id_user             integer default 0 not null
        constraint share_transaction_id_user_fkey
            references "user",
    id_checking_account integer default 0 not null
        constraint checking_account_fk_key
            references checking_account,
    date_update         date,
    accepted            boolean
);

alter table share_checking_account
    owner to postgres;


