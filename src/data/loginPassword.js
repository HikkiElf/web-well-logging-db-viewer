import { defineStore } from 'pinia';

export const useLoginPassword = defineStore('user', {
    state: () => ({
        loginPassword: {
            login: '',
            password: ''
        }
    })
})
