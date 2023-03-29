<script setup> 
    // import { defineProps } from 'vue';
    const {data} = defineProps(['data']);
    const emit = defineEmits(['changePicketId']);
    const pickets = data[0].areas[0].pickets;
    const getPicketId = (picketId) => {
        emit('changePicketId', picketId-1);
    }
</script>

<template>
    <table>
        <tr>
            <th>ID</th>
            <th>X</th>
            <th>Y</th>
        </tr>
        <tr v-for="picket in pickets" :key="picket.id" @click="getPicketId(picket.id)">
            <td>{{ picket.id }}</td>
            <td>{{ picket.X_picket_coord }}</td>
            <td>{{ picket.Y_picket_coord }}</td>
        </tr>
    </table>
</template>

<style lang="scss" scoped>

table {
    width: 150px;
    // height: 200px;
    position: relative;
    border-collapse: collapse;
    text-align: center;
    overflow: auto;
}

th {
    position: sticky;
    top: 0;
    background-color: var(--th-bg-color);
    padding: 0px 8px;
    height: 50px;
    font-size: 30px;
}

td {
    padding: 9px 8px;
    transition: .1s linear;
    font-size: 20px;
}

tr {
    border-bottom: 2px solid white;
    cursor: pointer;
}

tr:hover {
    background-color: var(--tr-hover-bg-color);
}

tr:last-child {
    border-bottom: none;
}

</style>