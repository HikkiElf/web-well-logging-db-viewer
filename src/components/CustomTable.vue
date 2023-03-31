<script setup> 
    // import { defineProps } from 'vue';
    import { ref, watch, toRef, isRef } from "vue";
    import data from "../data/data.json";
    const props = defineProps(['areaName']);
    const emit = defineEmits(['getPicketId']);
    const allArea = data[0].areas;
    // console.log(toRef(allArea, 'areaName'));
    const searchIndex = ref(0);
    const pickets = ref(allArea[0].pickets);

    watch(toRef(props, 'areaName'), async (newName, oldName) => {
        console.log(props.areaName + " CURRENT AREA");
        console.log("IM HERE HELP ME " + oldName + " " + newName);
        searchIndex.value = allArea.findIndex((area) => area.area_name === props.areaName);
        if (searchIndex.value == -1) searchIndex.value = 0;
        console.log(searchIndex.value + " = searchIndex update");
        console.log(allArea[searchIndex.value].pickets)
        pickets.value = allArea[searchIndex.value].pickets;
    })




    const log = (msg) => {
        console.log(msg + " CUSTOM LOG");
    }

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
        <tr v-for="picket in pickets" :key="picket.id" @click="changePicketId(picket.id); log(props.areaName)" >
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