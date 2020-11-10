create table if not exists accounts
(
    USER_NAME         varchar(100)              not null
        primary key,
    ACTIVE            bit                       not null,
    ENCRYTED_PASSWORD varchar(128)              not null,
    USER_ROLE         varchar(20)               not null,
    email             varchar(256) charset utf8 null,
    reset_code        int                       null
);

create table if not exists banner
(
    id          bigint unsigned auto_increment
        primary key,
    content     text      not null,
    image       longblob  not null,
    image2      longblob  null,
    position    int       not null,
    category_id int       not null,
    deleted_at  timestamp null,
    created_at  timestamp null,
    updated_at  timestamp null
)
    collate = utf8mb4_unicode_ci;

create table if not exists blogs
(
    id                bigint unsigned auto_increment
        primary key,
    title             varchar(255) null,
    short_description text         null,
    description       longtext     null,
    image             longblob     null,
    category_id       bigint       null,
    deleted_at        timestamp    null,
    created_at        timestamp    null,
    updated_at        timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index blogs_id_index
    on blogs (id);

create table if not exists brands
(
    id          bigint unsigned auto_increment
        primary key,
    brand_name  varchar(255) not null,
    description varchar(255) null,
    slug        varchar(255) null,
    created_at  timestamp    null,
    updated_at  timestamp    null,
    deleted_at  timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index brands_id_index
    on brands (id);

create table if not exists categories
(
    id            bigint unsigned auto_increment
        primary key,
    category_name varchar(50) not null,
    image         longblob    null,
    description   longtext    null,
    deleted_at    timestamp   null,
    created_at    timestamp   null,
    updated_at    timestamp   null
)
    collate = utf8mb4_unicode_ci;

create index categories_id_index
    on categories (id);

create table if not exists comments
(
    id           bigint auto_increment
        primary key,
    user_name    varchar(256) charset utf8   null,
    content      varchar(10000) charset utf8 null,
    created_date datetime                    null,
    product_code varchar(20) charset utf8    not null,
    constraint comments_product_code_uindex
        unique (product_code)
);

create table if not exists contact
(
    id           bigint unsigned auto_increment
        primary key,
    name         varchar(255) not null,
    email        varchar(255) not null,
    phone_number varchar(255) not null,
    subject      varchar(255) not null,
    message      text         not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table if not exists countries
(
    id           bigint unsigned auto_increment
        primary key,
    country_name varchar(255) not null,
    created_at   timestamp    null,
    updated_at   timestamp    null,
    deleted_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index countries_id_index
    on countries (id);

create table if not exists customers
(
    id            bigint unsigned auto_increment
        primary key,
    customer_name varchar(100) not null,
    email         varchar(100) null,
    phone_number  varchar(100) not null,
    address       varchar(100) null,
    gender        varchar(100) not null,
    ward_id       int          not null,
    district_id   int          not null,
    city_id       int          not null,
    deleted_at    timestamp    null,
    created_at    timestamp    null,
    updated_at    timestamp    null
)
    collate = utf8mb4_unicode_ci;

create index customers_id_index
    on customers (id);

create table if not exists discount
(
    id               bigint unsigned auto_increment
        primary key,
    discount_percent decimal(8, 2) not null,
    start_date       date          not null,
    end_date         date          not null,
    created_at       timestamp     null,
    updated_at       timestamp     null,
    deleted_at       timestamp     null
)
    collate = utf8mb4_unicode_ci;

create table if not exists orders
(
    ID               varchar(50)   not null
        primary key,
    AMOUNT           double        not null,
    CUSTOMER_ADDRESS varchar(255)  not null,
    CUSTOMER_EMAIL   varchar(128)  not null,
    CUSTOMER_NAME    varchar(255)  not null,
    CUSTOMER_PHONE   varchar(128)  not null,
    ORDER_DATE       datetime      not null,
    ORDER_NUM        int           not null,
    user_name        varchar(100)  null,
    status           int default 1 null,
    constraint ORDER_UK
        unique (ORDER_NUM)
);

create table if not exists product_rating
(
    id           bigint unsigned auto_increment
        primary key,
    user_name    varchar(100) not null,
    product_code varchar(20)  null,
    rating       smallint     not null,
    message      text         not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;

create table if not exists products
(
    CODE        varchar(20)   not null
        primary key,
    NAME        varchar(255)  not null,
    PRICE       double        not null,
    CREATE_DATE datetime      not null,
    category_id bigint        null,
    brand_id    bigint        null,
    discount    int default 0 null
);

create table if not exists order_details
(
    ID         varchar(50) not null
        primary key,
    AMOUNT     double      not null,
    PRICE      double      not null,
    QUANITY    int         not null,
    ORDER_ID   varchar(50) not null,
    PRODUCT_ID varchar(20) not null,
    constraint ORDER_DETAIL_ORD_FK
        foreign key (ORDER_ID) references orders (ID),
    constraint ORDER_DETAIL_PROD_FK
        foreign key (PRODUCT_ID) references products (CODE)
);

create table if not exists social_account
(
    id       int auto_increment
        primary key,
    username varchar(45) not null,
    password varchar(45) not null
)
    charset = utf8;

create table if not exists userconnection
(
    USERID         varchar(255) not null,
    PROVIDERID     varchar(255) not null,
    PROVIDERUSERID varchar(255) not null,
    `RANK`         int          not null,
    DISPLAYNAME    varchar(255) null,
    PROFILEURL     varchar(512) null,
    IMAGEURL       varchar(512) null,
    ACCESSTOKEN    varchar(255) not null,
    SECRET         varchar(255) null,
    REFRESHTOKEN   varchar(255) null,
    EXPIRETIME     bigint       null,
    primary key (USERID, PROVIDERID, PROVIDERUSERID),
    constraint USERCONNECTIONRANK
        unique (USERID, PROVIDERID, `RANK`)
)
    charset = utf8;

create table if not exists wish
(
    id           bigint unsigned auto_increment
        primary key,
    user_name    varchar(100) not null,
    product_code varchar(20)  not null,
    created_at   timestamp    null,
    updated_at   timestamp    null
)
    collate = utf8mb4_unicode_ci;


