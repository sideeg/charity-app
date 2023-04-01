<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        \App\Models\countrie::factory(1)->create();
        \App\Models\state::factory(10)->create();
        \App\Models\city::factory(10)->create();
        \App\Models\admin::factory(1)->create();
        \App\Models\categorie::factory(2)->create();





    }
}
