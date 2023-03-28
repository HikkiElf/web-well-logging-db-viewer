<script>
export default{
    props: {
        data: Array,
        columns: Array
    },
    data() {
        return {
            sortKey: '',
            sortOrders: this.columns.reduce((o, key) => ((o[key] = 1), o), {})
        }
    },
    methods: {
        sortBy(key) {
            this.sortKey = key
            this.sortOrders[key] = this.sortOrders[key] * -1
        }
    }
}
</script>

<template>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>X</th>
                <th>Y</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="nums in 100">
                <td>{{ nums }}</td>
                <td>{{ nums }}</td>
                <td>{{ nums }}</td>
            </tr>
        </tbody>
        
    </table>

</template>