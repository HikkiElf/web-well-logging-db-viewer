<script setup>
    import { ref, watch} from 'vue';
    import CustomTable from '../components/CustomTable.vue';
    import d from "../data/data.json"

    const projectData = ref(d);



</script>

<template>
    <div class="table-container">
        <CustomTable :project-data="projectData" />
    </div>
</template>

<style lang="scss" scoped>
div {
    color: white !important;
}
</style>