<script setup>
// import { defineProps } from 'vue';
import { ref, watch, toRef, computed } from "vue";
import axios from "axios";

const props = defineProps(["selectedAreaId"]);

const emit = defineEmits(["getPicketId"]);

const refPicketsInArea = ref();

const X_coord = ref("");

const Y_coord = ref("");

const searchResult = ref(refPicketsInArea.value);

watch(toRef(props, "selectedAreaId"), async () => {
    refPicketsInArea.value = (
        await axios.get(
            `https://well-logging.mrsmori.moe/pickets?area_id=${props.selectedAreaId}`
        )
    ).data;
    searchResult.value = refPicketsInArea.value;
});

watch([X_coord, Y_coord], () => {
    if (X_coord.value == "" || Y_coord.value == "") {
        searchResult.value = refPicketsInArea.value;
        console.log(X_coord.value);
    } else {
        searchResult.value = refPicketsInArea.value.filter(
            (data) => data.X_picket_coord == X_coord.value
        );
        searchResult.value = searchResult.value.filter(
            (data) => data.Y_picket_coord == Y_coord.value
        );
    }
    console.log(typeof X_coord.value, "AAAA");
});

const changePicketId = (picketId) => {
    emit("getPicketId", picketId);
};
</script>

<template>
    <div class="input-container">
        <input type="text" v-model="X_coord" placeholder="X" />
        <input type="text" v-model="Y_coord" placeholder="Y" />
    </div>
    <table>
        <tr>
            <th>ID</th>
            <th>X</th>
            <th>Y</th>
        </tr>
        <tr v-for="picket in searchResult" :key="picket.id" @click="changePicketId(picket.id)">
            <td>{{ picket.id }}</td>
            <td>{{ picket.X_picket_coord }}</td>
            <td>{{ picket.Y_picket_coord }}</td>
        </tr>
    </table>
</template>

<style lang="scss" scoped>
table {
    margin-top: 5px;
    width: 160px;
    // height: 200px;
    position: relative;
    border-collapse: collapse;
    text-align: center;
    overflow: auto;
    border: 2px solid white;
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
    transition: 0.1s linear;
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

.input-container {
    margin-right: 6px;
}

input {
    margin-top: 10px;
    margin-left: 10px;
    border: 2px solid white;
    border-radius: 8px;
    padding: 2px;
    width: 35px;
    text-align: center;
}
</style>
