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

interface BarangKeluar {
    id: number;
    kode_barang: string;
    nama_barang: string;
    item_id: number;
    tanggal: Date;
    jumlah_keluar: number;
    keterangan: string;
}

interface Props {
    barangkeluar: BarangKeluar[];
}

const handleDelete = (id: number) => {
    if (confirm('Do you want to delete the outgoing product?')) {
        router.delete(`/barangkeluar/${id}`);
    }
};

const props = defineProps<Props>();

const page = usePage();

const breadcrumbs: BreadcrumbItem[] = [
    {
        title: 'Outgoing Products',
        href: '/barangkeluar',
    },
];
</script>

<template>
    <Head title="Outgoing Products" />

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
            <Link href="/barangkeluar/create"
                ><Button>Add Outgoing Product</Button></Link
            >
        </div>

        <Table>
            <TableCaption>A list of outgoing products.</TableCaption>
            <TableHeader>
                <TableRow>
                    <TableHead>Product</TableHead>
                    <TableHead>Date</TableHead>
                    <TableHead>Outgoing Stock</TableHead>
                    <TableHead> Description</TableHead>
                    <TableHead class="text-center"> Action </TableHead>
                </TableRow>
            </TableHeader>
            <TableBody>
                <TableRow
                    v-for="product in props.barangkeluar"
                    :key="product.item_id"
                >
                    <TableCell class="font-medium">
                        {{ product.kode_barang }} - {{ product.nama_barang }}
                    </TableCell>
                    <TableCell>{{ product.tanggal }}</TableCell>
                    <TableCell>{{ product.jumlah_keluar }}</TableCell>
                    <TableCell>
                        {{ product.keterangan }}
                    </TableCell>
                    <TableCell class="space-x-2 text-center">
                        <Link :href="`/barangkeluar/${product.id}/edit`"
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
