<script setup lang="ts">
import { Alert, AlertDescription, AlertTitle } from '@/components/ui/alert';
import Button from '@/components/ui/button/Button.vue';
import {
    Table,
    TableBody,
    TableCaption,
    TableCell,
    TableHead,
    TableHeader,
    TableRow,
} from '@/components/ui/table/';
import AppLayout from '@/layouts/AppLayout.vue';
import { type BreadcrumbItem } from '@/types';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import { Check } from 'lucide-vue-next';

interface BarangMasuk {
    id: number;
    kode_barang: string;
    nama_barang: string;
    item_id: number;
    tanggal: Date;
    jumlah_masuk: number;
    keterangan: string;
}

interface Props {
    barangmasuk: BarangMasuk[];
}

const handleDelete = (id: number) => {
    if (confirm('Do you want to delete the incoming product?')) {
        router.delete(`/barangmasuk/${id}`);
    }
};

const props = defineProps<Props>();

const page = usePage();

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Incoming Products',
        href: '/barangmasuk',
    },
];
</script>

<template>
    <Head title="Incoming Products" />

    <AppLayout :breadcrumbs="breadcrumbs">
        <div class="p-4">
            <div v-if="$page.props.flash?.message" class="alert">
                <Alert class="mb-6 bg-green-900">
                    <Check />
                    <AlertTitle>Notification!</AlertTitle>
                    <AlertDescription>
                        {{ $page.props.flash.message }}
                    </AlertDescription>
                </Alert>
            </div>
            <Link href="/barangmasuk/create"
                ><Button>Add Incoming Product</Button></Link
            >
        </div>

        <Table>
            <TableCaption>A list of incoming products.</TableCaption>
            <TableHeader>
                <TableRow>
                    <TableHead>Product</TableHead>
                    <TableHead>Date</TableHead>
                    <TableHead>Incoming Stock</TableHead>
                    <TableHead> Description</TableHead>
                    <TableHead class="text-center"> Action </TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow
                    v-for="product in props.barangmasuk"
                    :key="product.item_id"
                >
                    <TableCell class="font-medium">
                        {{ product.kode_barang }} - {{ product.nama_barang }}
                    </TableCell>
                    <TableCell>{{ product.tanggal }}</TableCell>
                    <TableCell>{{ product.jumlah_masuk }}</TableCell>
                    <TableCell>
                        {{ product.keterangan }}
                    </TableCell>
                    <TableCell class="space-x-2 text-center">
                        <Link :href="`/barangmasuk/${product.id}/edit`"
                            ><Button class="bg-blue-400">Edit</Button></Link
                        >
                        <Button
                            class="bg-red-400"
                            @click="handleDelete(product.id)"
                            >Delete</Button
                        >
                    </TableCell>
                </TableRow>
            </TableBody>
        </Table>
    </AppLayout>
</template>
