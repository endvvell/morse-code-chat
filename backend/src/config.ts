
export interface envTS {
    [key: string]: {
        [key: string]: (number | string)
    },
}

const env: envTS = {
    dev: {
        httpPort: 3001,
        httpsPort: 3002,
        webSocketPort: 3003,
        evnName: 'dev env',

        // db credentials
        user: 'aaaa',
        host: 'aaaa',
        database: 'aaaa',
        dbPassword: "aaaa@",
        dbPort: 1234,
        dbSecretKey: 'aaaa',
    },

    // the values are the same, but this file is just for demonstration anyway
    prod: {
        httpPort: 3001,
        httpsPort: 3002,
        webSocketPort: 3003,
        evnName: 'prod env',

        // db credentials
        user: 'aaaa',
        host: 'aaaa',
        database: 'aaaa',
        dbPassword: "aaaa@",
        dbPort: 1234,
        dbSecretKey: 'aaaa',
    },
}


export const currentEnv = typeof (process.env.NODE_ENV) === 'string' ? env[process.env.NODE_ENV.toLowerCase()] : env.dev