<script setup> 
    // import { defineProps } from 'vue';
    import { ref, watch, toRef, isRef } from "vue";
    import data from "../data/data.json";
    const props = defineProps(['areaSearchIndex', 'projectSearchIndex']);
    const emit = defineEmits(['getPicketId']);
    const pickets = ref(data[props.projectSearchIndex].areas[props.areaSearchIndex].pickets);
    
    watch(toRef(props, 'projectSearchIndex'), async (newIndex) => {
       pickets.value = data[props.projectSearchIndex].areas[props.areaSearchIndex].pickets;
    })

    watch(toRef(props, 'areaSearchIndex'), async (newIndex) => {
        pickets.value = data[props.projectSearchIndex].areas[props.areaSearchIndex].pickets;
    })

    const changePicketId = (picketId) => {
        emit('getPicketId', picketId-1);
    };
</script>

<template>
    <table>
        <tr>
            <th>ID</th>
            <th>X</th>
            <th>Y</th>
        </tr>
        <tr v-for="picket in pickets" :key="picket.id" @click="changePicketId(picket.id)" >
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